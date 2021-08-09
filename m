Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEF13E459D
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 14:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbhHIM3i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 08:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234718AbhHIM3i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Aug 2021 08:29:38 -0400
Received: from orbyte.nwl.cc (orbyte.nwl.cc [IPv6:2001:41d0:e:133a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF7EC0613D3
        for <linux-leds@vger.kernel.org>; Mon,  9 Aug 2021 05:29:18 -0700 (PDT)
Received: from localhost ([::1]:48242 helo=xic)
        by orbyte.nwl.cc with esmtp (Exim 4.94.2)
        (envelope-from <phil@nwl.cc>)
        id 1mD4P4-0006Je-Q6; Mon, 09 Aug 2021 14:29:14 +0200
From:   Phil Sutter <phil@nwl.cc>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
Subject: [PATCH] leds: trigger: Add invert attribute to ledtrig-audio
Date:   Mon,  9 Aug 2021 14:29:10 +0200
Message-Id: <20210809122910.11580-1-phil@nwl.cc>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Inverting micmute LED used to be possible via a mixer setting, but
conversion to LEDs class (probably) killed it. Re-establish the old
functionality via sysfs attribute in audio LED triggers.

Signed-off-by: Phil Sutter <phil@nwl.cc>
---
 drivers/leds/trigger/ledtrig-audio.c | 106 ++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
index f76621e88482d..319ac4f514dfd 100644
--- a/drivers/leds/trigger/ledtrig-audio.c
+++ b/drivers/leds/trigger/ledtrig-audio.c
@@ -6,9 +6,12 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
 
 static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
 static enum led_brightness audio_state[NUM_AUDIO_LEDS];
+static bool led_invert[NUM_AUDIO_LEDS];
 
 enum led_brightness ledtrig_audio_get(enum led_audio type)
 {
@@ -18,17 +21,112 @@ EXPORT_SYMBOL_GPL(ledtrig_audio_get);
 
 void ledtrig_audio_set(enum led_audio type, enum led_brightness state)
 {
+	if (led_invert[type])
+		state = !state;
+
 	audio_state[type] = state;
 	led_trigger_event(ledtrig_audio[type], state);
 }
 EXPORT_SYMBOL_GPL(ledtrig_audio_set);
 
+static ssize_t do_invert_show(enum led_audio type, char *buf)
+{
+	return sprintf(buf, "%u\n", led_invert[type]);
+}
+
+static ssize_t mute_invert_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return do_invert_show(LED_AUDIO_MUTE, buf);
+}
+
+static ssize_t micmute_invert_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return do_invert_show(LED_AUDIO_MICMUTE, buf);
+}
+
+static ssize_t do_invert_store(enum led_audio type,
+			       const char *buf, size_t size)
+{
+	unsigned long state;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	led_invert[type] = !!state;
+	ledtrig_audio_set(type, audio_state[type]);
+
+	return size;
+}
+
+static ssize_t mute_invert_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	return do_invert_store(LED_AUDIO_MUTE, buf, size);
+}
+
+static ssize_t micmute_invert_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	return do_invert_store(LED_AUDIO_MICMUTE, buf, size);
+}
+
+static struct device_attribute dev_attr_mute_invert =
+		__ATTR(invert, 0644, mute_invert_show, mute_invert_store);
+
+static struct attribute *audio_mute_trig_attrs[] = {
+	&dev_attr_mute_invert.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(audio_mute_trig);
+
+static struct device_attribute dev_attr_micmute_invert =
+		__ATTR(invert, 0644, micmute_invert_show, micmute_invert_store);
+
+static struct attribute *audio_micmute_trig_attrs[] = {
+	&dev_attr_micmute_invert.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(audio_micmute_trig);
+
+static void __init do_ledtrig_audio_init(const char *name,
+					 enum led_audio type,
+					 const struct attribute_group **groups)
+{
+	struct led_trigger *trigger;
+	int err;
+
+	trigger = kzalloc(sizeof(struct led_trigger), GFP_KERNEL);
+	if (!trigger) {
+		pr_warn("LED trigger %s failed to register (no memory)\n",
+			name);
+		goto out;
+	}
+
+	trigger->name = name;
+	trigger->groups = groups;
+
+	err = led_trigger_register(trigger);
+	if (err < 0) {
+		kfree(trigger);
+		trigger = NULL;
+		pr_warn("LED trigger %s failed to register (%d)\n", name, err);
+	}
+out:
+	ledtrig_audio[type] = trigger;
+}
+
 static int __init ledtrig_audio_init(void)
 {
-	led_trigger_register_simple("audio-mute",
-				    &ledtrig_audio[LED_AUDIO_MUTE]);
-	led_trigger_register_simple("audio-micmute",
-				    &ledtrig_audio[LED_AUDIO_MICMUTE]);
+	do_ledtrig_audio_init("audio-mute", LED_AUDIO_MUTE,
+			      audio_mute_trig_groups);
+	do_ledtrig_audio_init("audio-micmute", LED_AUDIO_MICMUTE,
+			      audio_micmute_trig_groups);
 	return 0;
 }
 module_init(ledtrig_audio_init);
-- 
2.32.0

