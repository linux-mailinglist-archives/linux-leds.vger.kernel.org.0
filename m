Return-Path: <linux-leds+bounces-4387-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E4A777C4
	for <lists+linux-leds@lfdr.de>; Tue,  1 Apr 2025 11:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED197188BC7D
	for <lists+linux-leds@lfdr.de>; Tue,  1 Apr 2025 09:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CBB1E5B70;
	Tue,  1 Apr 2025 09:30:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA721E0E0B
	for <linux-leds@vger.kernel.org>; Tue,  1 Apr 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499810; cv=pass; b=A8EHSQP8jKlZApnM8Ma5aljXbVfLmvRnqb/tWqBFrCxEyH6IbTigcIUsf9h9uOLGhZEcMlFaZOT/9nen/OhcsdM51SdV9aK3qM+N2i5B9JeY0OqZn6w4qlypn1hw2Coj4u4vjEtcsE57NTmP3lMbXxz/rTuaTKTUxos5ykd9DVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499810; c=relaxed/simple;
	bh=Hp8Ak02cLoU2sa7JhI3D5/TMpJi0kGWEkYNCde/7LIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j9GwWdiho/nnDn6xGQ8sgB5jgwTcf2RBDO3zGnP3XaLcFN6BuJn+FOHKDQsTTqiw0t/6g4vlbuOTFh/1DjGdQqwlEMGRZ3hkqckO6VF2WZzHESxC5+q7G2bXkDU6gtpskRkxsVqCgbeNTAZlbmMV7m5goMueYbWmKyuwrSCtYmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1743497403; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hcrpdFAEJ64K+03O8rpSiUD8cc2U3Vc2Idc3qJouvA68OTOmbUlexNv/FjUxnX1zbD
    jL1OXewO/Mnzxlhy/2XL9mDytVl0U8pBTYdtFkZQYeOcT308MU6es5Us4OQXPVukE4PA
    nW9TkF1o7u76feKCS7vRlIRZngF1Ijvofj7EkY9Eg9iaknawaL+DsrneJhiizypvTGqj
    awi+Xuj4kMNTL/U3inlsTCT+2Xwy5OojEYPcXxligNlLl+ObszRW7yucmJrKYGpyrJGO
    d7gZlxGg6YZOw5enzllMW1drZYeqjUf5TMFbMzPEJkJlyUkqkRHyRly0IhcKFGf0e5kg
    8SVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1743497403;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=SS2MSXN2UcJXj2p3GXt3FN0Tj/+nje2uyZbonWYd12M=;
    b=hUL8yGX0kEq7ZFMn74qMXn7bgIiJr/X3fay8P5ClGScP2eGxiwHOCbZq5Xb+FdoA4O
    OADh0vl/pt6ko08zGMpjPvflWPXO2JZmN67vpoMA2oVC4uXJVUpORxACmdfLCvGVSPwL
    iP8mgjsTCm5+VGAY0TlHozFCxDHCy82l3oZiyJ5JThDS4gYoBPtwTAyGp3Uhe9aJMlBy
    OnzTN2XWm5ExHGgJ9Ao8xcXrp12uDa8HLwVpvWp36f1nvjVzOgEidzKY5I1h3L9YEcuC
    iosIirYjp83iz4dbDrDEkbOduneU45G0G4K117BP1MvwqGIM178MRMH0+VVm/ajR3Rim
    8rJw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErvsv7wxhn7R+CZYOGugK8="
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d71318o3zRt
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 1 Apr 2025 10:50:03 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: linux-leds@vger.kernel.org
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH] leds: trigger: netdev: Match net in netdev_trig_notify()
Date: Tue,  1 Apr 2025 10:49:59 +0200
Message-ID: <20250401085002.492904-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
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
index 4b0863db901a..1d620149c071 100644
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
+	bool same_net = trigger_data->net == NULL || (dev && net_eq(dev_net(dev), trigger_data->net));
 
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


