Return-Path: <linux-leds+bounces-4534-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742AA98AAA
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 15:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8336B444811
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 13:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4E89460;
	Wed, 23 Apr 2025 13:16:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766E175D39;
	Wed, 23 Apr 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414208; cv=pass; b=QD9zY08wVhcDoxaFQMh5Ka3CqCflcqpkYJ1WsQPZTG8LgEEsBcWWcpPtVA/sNze8ccImNCBV2njq/X1zxD7ZalaKTXmFpyhH+vgfzymmV/nzfTPF2CJbHCLKEXXib1XvFATQ5dy7X4lnn7WH0p4xqSdf5bN6TCeYXMG0TGLszJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414208; c=relaxed/simple;
	bh=kNayzEzkjCs1/4pm8otoqw4jLJ+GydTPyP6NPwYg2WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VS2L7+y+JXian2aDEu1zIgUpkjMfrLc6GWJd6i6iQgUL0DBGcscP2GrokZmbVyonG+JV5t4uV/1t+QmNUdFbsvDgqjx4CLpf002Dey/eL28QfYls5i3mfuN09WK8NaBHfhNg+1xvp5zLw7xR0I3zpM2WU0YQDYxchTl3x785dtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1745414009; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HRXU7wGshUu532ZxcY7tV+qEp6mFzKOi4q/UyV+bq+RHQ3YKgsrvEX0AsJqaT9lYIL
    eTKwDacEjzKu/PanfGqCGE32rt9JzMpzJGR/CA4LHaueFgZsP+4SIUtuZyNnlhrjxkjn
    K2yVWy24OLn/MimBQOU37zGZWBgtJ3kFcO0Wt5531/Vxx+WHd9azzx1lbOcdg9RgQg1j
    96SIjXO7i+LLks1+PFgncERV7w75ynKDGId+s344H/mhjujKyAV4Uzrzp1mvCZfZbYdI
    CvBcL7tEts0aJM5D+WvVOi3fgDp+nsqsRFTlG/DDlI7LMnRURfz9P36siji+6czrS/0i
    vUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1745414009;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BMg4HvcYreT+0C+HGW4OV8l9drZXEa9SFupW3ExIgjk=;
    b=ld+7wWGKC+MkrJzPSqFypwET8M672NqOWOemuPnDz7ExKkXg84HHp2GZMAjdspjcxO
    PGtFOnP0dSKQJoEK6oVGpLUHoDlaUUddQzUhM9hYLx++fcINKCdkOE4eiowO+GwmNt8/
    BjEuidcPxYBEsWyFtICEoSxW0TbZnDCt6YnH25YoeP8J0LxJ76CJ+YfzdvgX+JOEedcB
    9JxQ0WA975v0iQag9WpEW/j5TQMYAgEncY1/pZdJlGprWgxf+GV7p/lo4cH61s6MBDbk
    OBIsE3sHz81rZFFa2LK+iKmHAT/WucN+wA4TLcLQuoDNm1+SyC9k0kTrHgDPGFIXhLVz
    qhpw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErvsv7wxhn7R+CZYOGugK8="
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d713NDDTBQz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 23 Apr 2025 15:13:29 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH v2] leds: trigger: netdev: refactor dev matching in netdev_trig_notify()
Date: Wed, 23 Apr 2025 15:13:23 +0200
Message-ID: <20250423131325.235098-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411074421.GV372032@google.com>
References: <20250411074421.GV372032@google.com>
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


