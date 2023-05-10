Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F596FE26A
	for <lists+linux-leds@lfdr.de>; Wed, 10 May 2023 18:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbjEJQYk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 May 2023 12:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235456AbjEJQYO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 May 2023 12:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCBC7DA2
        for <linux-leds@vger.kernel.org>; Wed, 10 May 2023 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683735770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8tnL1xWCq3PfYOP0oeRvtftEb9HdHTHxsjcy9mxUMuQ=;
        b=iFaAD9CYu/lQ3NkjaW88VgC2cJZu7GjgOzs/KCIbCt9apwehumh9mhf+a9p7tvenI030z/
        HZi68EHaoKuaCJ9TqhIN6iNYtLvdchQeNcJaaQkTZ65y7mzMPNB3t6S8bUL5u1rUD1bDGy
        S3IyduRFOK26cMi1Sz9+NFaUTfglZG0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Q3q49gV-OlWSiJTrOEXtcg-1; Wed, 10 May 2023 12:22:46 -0400
X-MC-Unique: Q3q49gV-OlWSiJTrOEXtcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 735B9811E7C;
        Wed, 10 May 2023 16:22:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5BAF04078906;
        Wed, 10 May 2023 16:22:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Johannes Berg <johannes@sipsolutions.net>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH RESEND 3/4] leds: Fix oops about sleeping in led_trigger_blink()
Date:   Wed, 10 May 2023 18:22:33 +0200
Message-Id: <20230510162234.291439-4-hdegoede@redhat.com>
In-Reply-To: <20230510162234.291439-1-hdegoede@redhat.com>
References: <20230510162234.291439-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

led_trigger_blink() calls led_blink_set() from a RCU read-side critical
section so led_blink_set() must not sleep. Note sleeping was not allowed
before the switch to RCU either because a spinlock was held before.

led_blink_set() does not sleep when sw-blinking is used, but
many LED controller drivers with hw blink support have a blink_set
function which may sleep, leading to an oops like this one:

[  832.605062] ------------[ cut here ]------------
[  832.605085] Voluntary context switch within RCU read-side critical section!
[  832.605119] WARNING: CPU: 2 PID: 370 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x4ee/0x690
<snip>
[  832.606453] Call Trace:
[  832.606466]  <TASK>
[  832.606487]  __schedule+0x9f/0x1480
[  832.606527]  schedule+0x5d/0xe0
[  832.606549]  schedule_timeout+0x79/0x140
[  832.606572]  ? __pfx_process_timeout+0x10/0x10
[  832.606599]  wait_for_completion_timeout+0x6f/0x140
[  832.606627]  i2c_dw_xfer+0x101/0x460
[  832.606659]  ? psi_group_change+0x168/0x400
[  832.606680]  __i2c_transfer+0x172/0x6d0
[  832.606709]  i2c_smbus_xfer_emulated+0x27d/0x9c0
[  832.606732]  ? __schedule+0x430/0x1480
[  832.606753]  ? preempt_count_add+0x6a/0xa0
[  832.606778]  ? get_nohz_timer_target+0x18/0x190
[  832.606796]  ? lock_timer_base+0x61/0x80
[  832.606817]  ? preempt_count_add+0x6a/0xa0
[  832.606842]  __i2c_smbus_xfer+0xa2/0x3f0
[  832.606862]  i2c_smbus_xfer+0x66/0xf0
[  832.606882]  i2c_smbus_read_byte_data+0x41/0x70
[  832.606901]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[  832.606922]  ? __pm_runtime_suspend+0x46/0xc0
[  832.606946]  cht_wc_byte_reg_read+0x2e/0x60
[  832.606972]  _regmap_read+0x5c/0x120
[  832.606997]  _regmap_update_bits+0x96/0xc0
[  832.607023]  regmap_update_bits_base+0x5b/0x90
[  832.607053]  cht_wc_leds_brightness_get+0x412/0x910 [leds_cht_wcove]
[  832.607094]  led_blink_setup+0x28/0x100
[  832.607119]  led_trigger_blink+0x40/0x70
[  832.607145]  power_supply_update_leds+0x1b7/0x1c0
[  832.607174]  power_supply_changed_work+0x67/0xe0
[  832.607198]  process_one_work+0x1c8/0x3c0
[  832.607222]  worker_thread+0x4d/0x380
[  832.607243]  ? __pfx_worker_thread+0x10/0x10
[  832.607258]  kthread+0xe9/0x110
[  832.607279]  ? __pfx_kthread+0x10/0x10
[  832.607300]  ret_from_fork+0x2c/0x50
[  832.607337]  </TASK>
[  832.607344] ---[ end trace 0000000000000000 ]---

Add a new led_blink_set_nosleep() function which defers the actual
led_blink_set() call to a workqueue when necessary to fix this.

This also fixes an existing race where a pending led_set_brightness() has
been deferred to set_brightness_work and might then race with a later
led_cdev->blink_set() call. Note this race is only an issue with triggers
mixing led_trigger_event() and led_trigger_blink() calls, sysfs API
calls and led_trigger_blink_oneshot() are not affected.

Note rather then adding a separate blink_set_blocking callback this uses
the presence of the already existing brightness_set_blocking callback to
detect if the blinking call should be deferred to set_brightness_work.

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-core.c     | 24 ++++++++++++++++++++++++
 drivers/leds/led-triggers.c |  2 +-
 include/linux/leds.h        | 24 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e61acc785410..b9b1295833c9 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -152,6 +152,13 @@ static void set_brightness_delayed(struct work_struct *ws)
 
 	if (test_and_clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags))
 		set_brightness_delayed_set_brightness(led_cdev, led_cdev->delayed_set_value);
+
+	if (test_and_clear_bit(LED_SET_BLINK, &led_cdev->work_flags)) {
+		unsigned long delay_on = led_cdev->delayed_delay_on;
+		unsigned long delay_off = led_cdev->delayed_delay_off;
+
+		led_blink_set(led_cdev, &delay_on, &delay_off);
+	}
 }
 
 static void led_set_software_blink(struct led_classdev *led_cdev,
@@ -246,6 +253,22 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_blink_set_oneshot);
 
+void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on,
+			   unsigned long delay_off)
+{
+	/* If necessary delegate to a work queue task. */
+	if (led_cdev->blink_set && led_cdev->brightness_set_blocking) {
+		led_cdev->delayed_delay_on = delay_on;
+		led_cdev->delayed_delay_off = delay_off;
+		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
+		schedule_work(&led_cdev->set_brightness_work);
+		return;
+	}
+
+	led_blink_set(led_cdev, &delay_on, &delay_off);
+}
+EXPORT_SYMBOL_GPL(led_blink_set_nosleep);
+
 void led_stop_software_blink(struct led_classdev *led_cdev)
 {
 	del_timer_sync(&led_cdev->blink_timer);
@@ -301,6 +324,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
 	} else {
 		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
+		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
 		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
 	}
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index e06361165e9b..8214d3f7bc5f 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -409,7 +409,7 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 			led_blink_set_oneshot(led_cdev, &delay_on, &delay_off,
 					      invert);
 		else
-			led_blink_set(led_cdev, &delay_on, &delay_off);
+			led_blink_set_nosleep(led_cdev, delay_on, delay_off);
 	}
 	rcu_read_unlock();
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index de813fe96a20..50b2f8f153fb 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -127,6 +127,7 @@ struct led_classdev {
 	/* Brightness off also disables hw-blinking so it is a separate action */
 #define LED_SET_BRIGHTNESS_OFF		6
 #define LED_SET_BRIGHTNESS		7
+#define LED_SET_BLINK			8
 
 	/* Set LED brightness level
 	 * Must not sleep. Use brightness_set_blocking for drivers
@@ -150,6 +151,10 @@ struct led_classdev {
 	 * match the values specified exactly.
 	 * Deactivate blinking again when the brightness is set to LED_OFF
 	 * via the brightness_set() callback.
+	 * For led_blink_set_nosleep() the LED core assumes that blink_set
+	 * implementations, of drivers which do not use brightness_set_blocking,
+	 * will not sleep. Therefor if brightness_set_blocking is not set
+	 * this function must not sleep!
 	 */
 	int		(*blink_set)(struct led_classdev *led_cdev,
 				     unsigned long *delay_on,
@@ -173,6 +178,8 @@ struct led_classdev {
 
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
+	unsigned long		delayed_delay_on;
+	unsigned long		delayed_delay_off;
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
@@ -275,12 +282,27 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
  * software blinking if there is no hardware blinking or if
  * the LED refuses the passed values.
  *
+ * This function may sleep!
+ *
  * Note that if software blinking is active, simply calling
  * led_cdev->brightness_set() will not stop the blinking,
  * use led_set_brightness() instead.
  */
 void led_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
 		   unsigned long *delay_off);
+
+/**
+ * led_blink_set_nosleep - set blinking, guaranteed to not sleep
+ * @led_cdev: the LED to start blinking
+ * @delay_on: the time it should be on (in ms)
+ * @delay_off: the time it should ble off (in ms)
+ *
+ * This function makes the LED blink and is guaranteed to not sleep. Otherwise
+ * this is the same as led_blink_set(), see led_blink_set() for details.
+ */
+void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on,
+			   unsigned long delay_off);
+
 /**
  * led_blink_set_oneshot - do a oneshot software blink
  * @led_cdev: the LED to start blinking
@@ -294,6 +316,8 @@ void led_blink_set(struct led_classdev *led_cdev, unsigned long *delay_on,
  *
  * If invert is set, led blinks for delay_off first, then for
  * delay_on and leave the led on after the on-off cycle.
+ *
+ * This function is guaranteed not to sleep.
  */
 void led_blink_set_oneshot(struct led_classdev *led_cdev,
 			   unsigned long *delay_on, unsigned long *delay_off,
-- 
2.40.1

