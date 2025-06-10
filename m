Return-Path: <linux-leds+bounces-4770-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28033AD3541
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 13:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6E187A9ED3
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 11:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3B328C016;
	Tue, 10 Jun 2025 11:43:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35351FC11F;
	Tue, 10 Jun 2025 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555837; cv=pass; b=DvO4zxcPfxEPjf3onA12CeklPF9YBgcNkz+OUYMrfsBgwqCvR2+d7zWSz2AX72E4XRACkEAIYwhPICc0SxBbfwVHFgyAp3F+e51TabjhERhoIWt//IURkz6tsxDqCZL1nblaxKT2KYdbvOoaUMiZmydZRg/ny0nmDYpmqlyyoew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555837; c=relaxed/simple;
	bh=3pfg9+NOL9Z6C2kDRxwBlHKPTOUuNHjM2OTYR6PYrc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyxKR/8VJFlKjZD7XvwY3slpkNLXlVrMUWd108SEtZntkVVG7wTJY8kx/JY8e3Za73vApG41nE32SgTJhocpp8fCsok6jgGrJiGANkURhugFWQFWenEUVj2pSg0f1LU96HXaAxTchzfQiPrRdiMud5ziCqLxv2UImms7ru/ic7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de; spf=pass smtp.mailfrom=inhub.de; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inhub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inhub.de
ARC-Seal: i=1; a=rsa-sha256; t=1749555649; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YZ1EHzYIf1PKdQpDhOk2uvvSFpXrEsS5zufu0eS6zLG9yNP5ql7+kspHG2IsrYQZcP
    aF9L3VYqOLZt+lHBciBend1iBpi2fQJZ7yA8x1tCP/L07+XSSHvE+XGplFLj7wtsnKb7
    lw+lEpf4AjUJ79MrtyQzNUWtLVz55Yir9fGDWTxmWsUsancZ+xB4Rp6OafOHhIcNwTBn
    A5n47cy+g3gMIfVTrZiuYxmDDhutMY1boMFxwrUm3xZZZidEPcLWWjvhX7iA0okdvodz
    GSI+p+oXsqlWvU9XuSEsht/0SAuGABBMD4KkeicpcagprbcGRJ4iBlq5Id7/Yj9lzkUq
    HteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749555649;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+USfT8fUhTO+Fl9hwpSWxcPLWELa5gF0F9SDLGkBSXY=;
    b=fgErK5PCwl+DMS5EJxYMqvaLjMWy57x0Gfpjh4Yt/Pk5UpmcTE3e65Wizal1LILL4p
    MMFE33lOQOlc9RiLW67jR49EjMWhHXDC3yGwKbspE4HRwVYeliiu0khAo2Q2jL+Lrjkq
    OolT8xc72aGBqDT4eKHuOZkd8bKUI591VZYPkX0RzHumAOKjh4/j9bqVO3XzYMvGa9iV
    n3z1+1C2xxTDcyOienba1z1FVJQGqz1BbM3ZfVRgAlkoC/5UvjIBveZdqaXCjIwzoQ1s
    cj1XI+EVR26QnROkPUoF8O4lygu39hSGEAX36hZ0bEUMjqmfCfAxvItP072BG+D3CVgz
    25uQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErvsv7wxhn7R+CZYOGugK8="
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J569d715ABen5ya
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 13:40:49 +0200 (CEST)
From: Tobias Junghans <tobias.junghans@inhub.de>
To: Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH 1/2] leds: trigger: netdev: separate event checks
Date: Tue, 10 Jun 2025 13:40:19 +0200
Message-ID: <20250610114029.268938-2-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610114029.268938-1-tobias.junghans@inhub.de>
References: <20250610114029.268938-1-tobias.junghans@inhub.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Move event handling checks into a separate function to ease subsequent
refactorings of the actual logic.

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
---
 drivers/leds/trigger/ledtrig-netdev.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 4e048e08c4fd..6e16619719fe 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -575,6 +575,22 @@ static const struct attribute_group *netdev_trig_groups[] = {
 	NULL,
 };
 
+static bool netdev_event_requires_handling(unsigned long evt, struct net_device *dev,
+					   struct led_netdev_data *trigger_data)
+{
+	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
+	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
+	    && evt != NETDEV_CHANGENAME)
+		return false;
+
+	if (!(dev == trigger_data->net_dev ||
+	     (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
+	     (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
+		return false;
+
+	return true;
+}
+
 static int netdev_trig_notify(struct notifier_block *nb,
 			      unsigned long evt, void *dv)
 {
@@ -584,14 +600,7 @@ static int netdev_trig_notify(struct notifier_block *nb,
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
+	if (!netdev_event_requires_handling(evt, dev, trigger_data))
 		return NOTIFY_DONE;
 
 	cancel_delayed_work_sync(&trigger_data->work);
-- 
2.43.0


