Return-Path: <linux-leds+bounces-7415-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D/UDhKewGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7415-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:57:38 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A062EBB6E
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20CC4303AABE
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5007F221FCD;
	Mon, 23 Mar 2026 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK1KsAcb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890E223DFF
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230889; cv=none; b=S0SmUWrjZ5QtseKpa6Z7W5VkOUcH8wbA/ElW5DDDLtTTc1GKGfOkNmJfNaX9gQOngd5FoQNbcL2Vala1jjFmN5DWvyTY/V+9KisxAODJjsNPFGd3GczntguzVUW+KXKdNfoiT1E6C10BPEgtx3YqGdZcAJDyn6+XPj1CnbxPFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230889; c=relaxed/simple;
	bh=vhx5QpoROnyh2q914MrL5geRu8AVJM0r0udOxsoTw6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UnhP4fb0QD8+166HtaUxkw/tXKoE/r4JM6Cddz1QaUhGnpNaRr0z2gbvztUbKmLRNs6InY11si+plEHg//I6+/U+0xuqSh5S+K7mf3tAnBiR5qLMt0omFgt21lWzgAcXYma+wTl3cU9lubd7yEzQxHs3gxm20lph/JJrx9/fhjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK1KsAcb; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0d36f3888so2265653eec.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230884; x=1774835684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFZooOyb7hfKDEpM9yx+Ztfv9BY6tuw4luVBl13uVrY=;
        b=VK1KsAcbFk0ksbY+/+vt6XBw+4QjtQuHRNv2SEHPfOltUX5iNis2R33+Du5wZHsRqr
         WrIvRasmCEwSh7fqmeugCo6feE8XtxjYVAWVs/aJTax+83KN+3yRpRiZCmHHN41kGc2E
         76E2GGvW0zof2A8SVr/BVlPkGidLkiOUt0hgfTa+VgwSDTvrIJY6IurRqy40KFb+FtEB
         wko5608F7xyI/q7h8A/GWDyJCZ0HJ7yB298qb2dIQbetqQ8w+Pcud+IFZJPxpS6mn9WL
         8sIGtXhR2VICewq97fNB6oQcilgCg1aGpsGvaPbSi+wk7JHrmVt562VfDZYB8cq9XLjF
         K0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230884; x=1774835684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFZooOyb7hfKDEpM9yx+Ztfv9BY6tuw4luVBl13uVrY=;
        b=q+QlraDgnBD/5pt9QYGa4RW+1slhpbLiW7j0bZkx5Ey96NnSEMrp0B5sBdy5RQRdWd
         oeSjfGa1GRSokORQ5lrc+0WhJUfXfbCaRRxtP9vQJlNQVqBzF6yKVvXb3GA88bz/DLLW
         2fzT+HMrPJAjhgDi3XAUa8JHQQ7x4uXic4HhFaQhEr9ZlvWY52aFfMeD4fnF0RvTY7sn
         cwhgdi9zA1kIjm6heQt/HW6vUdzQY+JSr1F0bt9kO4WlgbDu5msAVOuZJa35SoQBx9b7
         zKjTuXfbu3mqfw38yfdGTAPA0OPstp72W5ztypojtfVw/7ei85mc82HaZWzXZMwM9v/x
         Oyiw==
X-Forwarded-Encrypted: i=1; AJvYcCW+veddoCMJ6GU3FqI99MJoT96baRTgqaKNt8Dizb+MLoIpQL+chcCXv2jhKL19RMZ/lkwnyzrkpSQA@vger.kernel.org
X-Gm-Message-State: AOJu0YxUXjx/5/digGPfJyyj3Jt6t+kkYEYrJuEiT+0BkmGuhxWrU/dK
	7XyNL+LY5ROVZ0/2hEJFMmtfnYSvoMnZSUYb8ui8YbcPuZhbxXDddXjm
X-Gm-Gg: ATEYQzy3Wx510EW7PvzEW9X0oZxYf/JoFk2C2Fmha47BkeE6yR3nKoWvYmHaw475PVX
	AaICZarrROlkhl5w46wcwTGl+t2SvKj0FVKJjBFBOpCgh3evjs8bDCXPI4P1YLV0VmtVAm9xwmT
	tsbDMMcV+mtkfkMExEldQSBDs89p4AwHde8+Kx/ItBp33UBMITYje6oA4RtOf1HC07ARSOLEM+/
	Q+h56vlDqegKK+XRWK157OF4fE6IWyftyju8OOGuLeH4/T6+36bVvGbLHDtko9TpoATRp7e4xD0
	iucSybYZJWSjwt4z/BiNMD4UuwxdkXtzdWxC0McLGWRHqw+wqKVugFjYjfe5qXk32JlcTwSc75w
	A6gLzUNlCqathN7HPRddLG8JMaAgeKAL6mfNZwMoKIjWpdPVl2Y728ctyuL9a7WDDScnNbad5z2
	e0w31Pjp0P2zyGmS5b5hN507VxbNFdETTa0IAPtBQQpDS9EE/3iZTvguT0M1p0OBwbfZjNljYg4
	MEJIxlYfm5KAYs=
X-Received: by 2002:a05:7300:d517:b0:2be:1cb2:3a6 with SMTP id 5a478bee46e88-2c10980a523mr4129993eec.33.1774230883846;
        Sun, 22 Mar 2026 18:54:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 03/10] spi: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:21 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-3-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7415-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5A062EBB6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/spi/spi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index bf1df365f795..071a9ffdb59d 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -21,6 +21,7 @@
 #include <linux/kthread.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/percpu.h>
@@ -4948,11 +4949,12 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 /* The spi controllers are not using spi_bus, so we find it with another way */
 struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
 {
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
 	struct device *dev;
 
-	dev = class_find_device_by_of_node(&spi_controller_class, node);
+	dev = class_find_device_by_fwnode(&spi_controller_class, fwnode);
 	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
-		dev = class_find_device_by_of_node(&spi_target_class, node);
+		dev = class_find_device_by_fwnode(&spi_target_class, fwnode);
 	if (!dev)
 		return NULL;
 

-- 
2.53.0.959.g497ff81fa9-goog


