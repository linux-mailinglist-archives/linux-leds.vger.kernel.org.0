Return-Path: <linux-leds+bounces-4544-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973CA9CA17
	for <lists+linux-leds@lfdr.de>; Fri, 25 Apr 2025 15:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5F153BAFD5
	for <lists+linux-leds@lfdr.de>; Fri, 25 Apr 2025 13:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A74B2550B7;
	Fri, 25 Apr 2025 13:21:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C6253926;
	Fri, 25 Apr 2025 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587283; cv=pass; b=Gah+osQ0cSku4TUm0znUynHI4MvTOrSmqKnWJF7tweIZnHrhxnjHHXXavXMKwyynAHqXF8aCmBFVnf3OqgA5mtzTQpIjw6W+mUe15RQcdFsu4JCK//fcxNZgvYH2xPK+xC4vAN+x3KPV+2AQo5wZZuF28btGA1CHFeLmvIw7iGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587283; c=relaxed/simple;
	bh=kNayzEzkjCs1/4pm8otoqw4jLJ+GydTPyP6NPwYg2WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SR1YDKIVmdesvUFhMxbG5G/tY4Ph3wVlLrejSmSU6zDNkX2yp7sRwV8eIPG2cqKgyEfbrW3QpK7vIPiO5NHY6o+byZ7GOuxxicbLakL6t32D89g6P+rVTyKSJoyda/q4UHPpe4WnXpcpH2LXNpx0DjnZCgYbQXeaH4A+qbuGdUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=85.215.255.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1745587270; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=g31HPvacq0H8zPyUvuFlEzMqfZd4m5Ll8g5QDaxpllyQdvAAiMyXt9n1iCHCpQIrzX
    qEPD5mJfgFfNLQM938v8i3vYBvLKltWBFTzsKLZNTQmxIUdc28Seg3bEeGhVJTogBVIh
    e9/bKPKO82umK7kKPier6pCn9vgW8ok1JjrdPBkv3+J98MYYOFwPwIYCDkeeiw2C4Mva
    OyP3rUZSe5JrJU+zpgLvcdH+LSep2v13wiKcgZs3LzaIEzoqjoz3cSEHIdvSvd+/XLR8
    Ivd3bRXEfaTp12pCIjPsVrbazBTuaTyCg/V0NrQ6gqfXIcN/FT0tl/DVIsAYSMJfxMO9
    gwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1745587270;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=BMg4HvcYreT+0C+HGW4OV8l9drZXEa9SFupW3ExIgjk=;
    b=emqJjyAwNoX25qsG2wyw+LrbNJwphr7xJDSIuPk9c6Qd4c32JJEsrUbg2sH9nNCtpJ
    QlGUNXA5PmWpFNorhA1gJh36/vB/aczBHdOKDiGfxhWokwP9WT/caqCZPv/25fYujSIU
    oZNKws5a6KwOF8rQq4PYQrWUwrzTewz7DaOwfWpAE0ULDDOx81wrJBmdMm6aAoDhzXb9
    yybuQE20R6yPUxnyUungv+Ht1qIjt/arGxTPo7SCjsxGecaNUqfBwjcQh00qW8fa5aer
    p7k+jh1OWapeP3v+AeYe+UOQEShdKTlwam2Ooc3uYwlbfJk2P7dbvIK2leB1jdrrvE5n
    tD4A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErls+DxzE7mTFa0c128qaiSM/ViZgIbdU4Zj81TtbSyYrdxXLA="
Received: from crypto.fritz.box
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d713PDL9KSk
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 25 Apr 2025 15:21:09 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH v3] leds: trigger: netdev: refactor dev matching in netdev_trig_notify()
Date: Fri, 25 Apr 2025 15:20:45 +0200
Message-ID: <20250425132059.393144-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

If there are network devices with the same name in different
namespaces, ledtrig-netdev gets confused easily and switches between
these devices whenever there are NETDEV_CHANGENAME/NETDEV_REGISTER
notifications.  This happens since ledtrig-netdev only checks for
device name equality regardless of previous associations with another
network device with the same name.

Real world example: eth0 is the primary physical network interface and
ledltrig-netdev is associated with that interface. If now Docker creates
a virtual Ethernet interface (vethXXXX), moves it to the
container's net namespace and renames it to eth0, ledtrig-netdev
switches to this device and the LED no longer blinks for the original
(physical) network device.

Fix this by refactoring the conditions under which to return early with
NOTIFY_DONE inside netdev_trig_notify():

- For processing NETDEV_REGISTER events, the device name has to match
  and no association with a net_dev must exist.

- For processing NETDEV_CHANGENAME events, the associated and notified
  network device have to match. Alternatively the device name has to
  match and no association with a net_dev must exist.

- For all other events, the associated and notified network device have
  to match.

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
---
 drivers/leds/trigger/ledtrig-netdev.c | 29 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 4b0863db901a..75d8c8fe9afc 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -574,15 +574,28 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		container_of(nb, struct led_netdev_data, notifier);
 	struct led_classdev *led_cdev = trigger_data->led_cdev;
 
-	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
-	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
-	    && evt != NETDEV_CHANGENAME)
-		return NOTIFY_DONE;
-
-	if (!(dev == trigger_data->net_dev ||
-	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
-	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
+	switch (evt) {
+	case NETDEV_REGISTER:
+		if (trigger_data->net_dev ||
+		    strcmp(dev->name, trigger_data->device_name))
+			return NOTIFY_DONE;
+		break;
+	case NETDEV_CHANGENAME:
+		if (trigger_data->net_dev != dev &&
+		    (trigger_data->net_dev ||
+		     strcmp(dev->name, trigger_data->device_name)))
+			return NOTIFY_DONE;
+		break;
+	case NETDEV_UNREGISTER:
+	case NETDEV_UP:
+	case NETDEV_DOWN:
+	case NETDEV_CHANGE:
+		if (trigger_data->net_dev != dev)
+			return NOTIFY_DONE;
+		break;
+	default:
 		return NOTIFY_DONE;
+	}
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
-- 
2.43.0


