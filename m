Return-Path: <linux-leds+bounces-4423-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C1AA7D909
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 11:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0001E7A395E
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 09:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0240922F155;
	Mon,  7 Apr 2025 09:09:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52E22E406
	for <linux-leds@vger.kernel.org>; Mon,  7 Apr 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016989; cv=pass; b=HH66zkCKGwyaWqVkQNR6WxhcoR3DZ9iV7vOKvAXO0lZJ4ljuW8/uOFY9gFvHj+FVWHXcqd4MhQomlmnZDBFPWj9LeFz7N2z2ZJyiyKjY0i1Lb7MkWWJUYImL7qqqsVlChISayiaPX8JvFuyW7JvlO+RvBCwFIhJlCC17+HQVVlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016989; c=relaxed/simple;
	bh=NvBJi7rsYLEMzVRjqsCEmFYrhNbqabMqSeBkhoFZ9k4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEhhQVLiKTeq2xQhdB5gK8B0v5rPI523UAQgHdFD1dE5Z0tFweBczezvp5jUXBCBx1iAtg+LLMB6xkyKpmcIBREzpmSXSQrC/p+QfRwFxAGnOD3L7GlRqhYOV6MlkmacvhthAnzj4Sf7DOI9cBpmZAJjefD/rA7/C2kbRcifSvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=85.215.255.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1744016786; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BoRfpHjHtXT7BvVynmRcO2NHt7GSedTF7VThcgvW++jzD/V+4Qq/nYmXfCWmsqiRP5
    OwnHZaxVw3MExkJ83mBOPtXS3U/JvCUm3SoaHzzAi16UNpQHIdD4jvLt6rirSm6xcyIF
    HamF1FUbm5YMWiW8wnt+xvALSO6UDoQF9WEZGAH1qxnTGE7EXKCd2Xwa7wtqi0KAVlf3
    2tWLQbORgrAC7YfV+jRRWHkIjokFe91H2NkBbshcW2z+GiXMelQTBNmn/CfbgTWOvrVx
    2X5va+uB7JqzKzm1Duwym2ENihWUYYPd91bLxqwyfIUMUJob1NaeG1+Mgl66P7v8z//T
    Q+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1744016786;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GvvPWFFRsouWsbV33tsGduWhyqLYMQUi+RY3IXKDsEo=;
    b=CDyirA5VNwJRmVsIjLkLI6IRbHnqlepfGKVCBH+mZ+ENljRWj9tGcToCdg+MMx07JA
    civyGFU7aW2pnboDcTzAmA1FIBzbmESrPCYRgqcpTEbLKhw4acl9A6tTkBxQsB6H2fUv
    oqEYWAc8zXtFvYCiDxASxvmA/oFhI3TQIiyQQS09iNyEEZWsyesrk/BnpURH3l53UFNj
    ej+yQbhicGkmMDIANkUrg4uRmzhXyRxGj/PR/k03l/uBQbjV59lM3AbecItYQw/2BQPs
    wRZPSgXc1A9h3Q5ZU9JZ9hhnaXiJCC0KphztYSIKREZ7bEnuMLFEg3l8buE9fdgdkqiW
    QCRA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErvsv7wxhn7R+CZYOGugK8="
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d713796QJ3Z
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 7 Apr 2025 11:06:26 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH v2] leds: trigger: netdev: Match net in netdev_trig_notify()
Date: Mon,  7 Apr 2025 11:02:49 +0200
Message-ID: <20250407090455.677846-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404151042.GC372032@google.com>
References: <20250404151042.GC372032@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Different network devices may have the same device name if they are in
different network namespaces. This confuses ledtrig-netdev and leads to
undesired effects in certain situations.

When setting device_name to eth0, the trigger is attached to the
corresponding (physical) network device. Later a Docker container is
started. Docker now creates a virtual Ethernet interface (vethXXXX),
moves it to the container's net namespace and renames it to "eth0".
Subsequently ledtrig-netdev receives a NETDEV_CHANGENAME notification,
recognizes "eth0" as device and and switches its activity over to this
device. As a result the LED no longer blinks for the original (physical)
network device.

The described erroneous behavior can be fixed by tracking and comparing
the network namespaces of network devices.

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
---
 drivers/leds/trigger/ledtrig-netdev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 4b0863db901a..72bcb86cdcdb 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -62,6 +62,7 @@ struct led_netdev_data {
 
 	struct led_classdev *led_cdev;
 	struct net_device *net_dev;
+	struct net *net;
 
 	char device_name[IFNAMSIZ];
 	atomic_t interval;
@@ -274,6 +275,7 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 	if (trigger_data->net_dev) {
 		dev_put(trigger_data->net_dev);
 		trigger_data->net_dev = NULL;
+		trigger_data->net = NULL;
 	}
 
 	memcpy(trigger_data->device_name, name, size);
@@ -284,6 +286,8 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 	if (trigger_data->device_name[0] != 0)
 		trigger_data->net_dev =
 		    dev_get_by_name(&init_net, trigger_data->device_name);
+	if (trigger_data->net_dev)
+		trigger_data->net = dev_net(trigger_data->net_dev);
 
 	trigger_data->carrier_link_up = false;
 	trigger_data->link_speed = SPEED_UNKNOWN;
@@ -573,15 +577,16 @@ static int netdev_trig_notify(struct notifier_block *nb,
 	struct led_netdev_data *trigger_data =
 		container_of(nb, struct led_netdev_data, notifier);
 	struct led_classdev *led_cdev = trigger_data->led_cdev;
+	bool same_net = !trigger_data->net || net_eq(dev_net(dev), trigger_data->net);
 
 	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
 	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
 	    && evt != NETDEV_CHANGENAME)
 		return NOTIFY_DONE;
 
-	if (!(dev == trigger_data->net_dev ||
-	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
-	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
+	if (!((dev == trigger_data->net_dev && same_net) ||
+	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name) && same_net) ||
+	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name) && same_net)))
 		return NOTIFY_DONE;
 
 	cancel_delayed_work_sync(&trigger_data->work);
@@ -597,12 +602,14 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		dev_put(trigger_data->net_dev);
 		dev_hold(dev);
 		trigger_data->net_dev = dev;
+		trigger_data->net = dev_net(dev);
 		if (evt == NETDEV_CHANGENAME)
 			get_device_state(trigger_data);
 		break;
 	case NETDEV_UNREGISTER:
 		dev_put(trigger_data->net_dev);
 		trigger_data->net_dev = NULL;
+		trigger_data->net = NULL;
 		break;
 	case NETDEV_UP:
 	case NETDEV_CHANGE:
@@ -702,6 +709,7 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 
 	trigger_data->led_cdev = led_cdev;
 	trigger_data->net_dev = NULL;
+	trigger_data->net = NULL;
 	trigger_data->device_name[0] = 0;
 
 	trigger_data->mode = 0;
-- 
2.43.0


