Return-Path: <linux-leds+bounces-7419-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6QL52dwGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7419-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:55:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B8D2EBABA
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4705F3018C08
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9010949620;
	Mon, 23 Mar 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Secbzmgi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C04212FAD
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230897; cv=none; b=QSt3u+N8/EtX8uPLBtgEUPsZjdeT69NfmrJL6KNaR2JtIs52BfNAW1NDi/q5L2k/U2VC4zN56zhBYn88L0dc13bfR4WjHrzSjTb4q7iwiJa/tnNu3+f+nX9EKHWgY0g6xPqysNVFY9Fzyzgk2gL/82ZgyULA9Nab8fqf01wRUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230897; c=relaxed/simple;
	bh=I5fS+FwbEw0P5vASCqinmGTcQr2XqJ+MU7isqg4KgEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNii+xeUJzPgfXqLGVVyjVsVImvkK4Aanjct9ryXDhBtd1ccf7EqJp6YPRf/9i3mV2tXzCSHO/VAxtuTLsWpSnFRFSR1reM5J2FcOl2Z8jYWIZQPFKzZC+wVQ9N7hXX4El/ipTFEqjLdjEUEObqmsXC7xqH/ILpn1cYa5WePO1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Secbzmgi; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1271257ae53so4065074c88.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230895; x=1774835695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfkDMRyvNYwOzv0q3wBq2OUYpD97VO+f6771zL+oLTY=;
        b=Secbzmgi7FroaLb8xUHxJ3ELfo+qQW50YJN5LWVovKu0WNnW7nDa0O+BGf4+xaGS1e
         kqrKUjisgWI5BSxWmT2Ehq7RV5hHqHqLiF2xkY+ehbrkgQf6DganeDhT50esg4bb4jMN
         tI578Ui9XmqBrOTg+b3gAqG4O2px40fpv0eEb0W64hVfs4MZXo2ldAxN1oyf3s0/fxe3
         oNabLBfyrbu+7lciY2xzfYmjvWUupfnDLSWlSboP6hTK7lGxPqoWalLXpm0et3y2RbY8
         AbAtMbtLoKYOOg/IUNvTk0vFR+TcalivVeq6THQszgdUKZ82qPnAz43pcdGV4P/dPapf
         HSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230895; x=1774835695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfkDMRyvNYwOzv0q3wBq2OUYpD97VO+f6771zL+oLTY=;
        b=HPVrKr7RpkeV9dv42hGfeLNG9Q8D/jTp/PVLRb9cvgzNGCqE0ZE2EgmysopVKwm0Iz
         EcYnbAPHK7vaF6t6+rx4FZAClfJvdBueFa+PbwDaIuI7rZRhCIaj1PlljGo4GNc8l7Oo
         l5/YVQS9cLQg5qTh/cLsmUkE7jXYw5fc5Ij/TkY8Ke7UhL+B66ZspX5rfJjR+pfXilDc
         OKqoB4+jKKOFb4TQmympt26mGfRfpmvu4jA2nsK1Ppld9qZLAqwGhX3jfEhMiijdSMKu
         tsm+ATU6ZXA1Vs9V/OtbaGMIvcgnqSYBdgFdv33SCzoDorCRI6Kfi7nECCPMVajgoL2U
         1zLg==
X-Forwarded-Encrypted: i=1; AJvYcCXuOANEFqAudfgwG9bl74RpP4vu317K50pb1ZHqXzXyrxbHlonK20DwzzmIGUWQyb9hCqf8jZAHWzjr@vger.kernel.org
X-Gm-Message-State: AOJu0YwllH/bLmwILZXDIeBqRm5aRoK2SNzozeAWsE/5wwrp1ipbLVAj
	Cj4oaWLOGmo38ox3BuQF9Zp8fMmCwIG6WAgY+5BmE2/kT0VUbULjD+be
X-Gm-Gg: ATEYQzweMT6kj5u9SEMzivreolnQc0TwWsuhC+DwyHMtPga5K6VJYFvsf620N77J8l3
	C1VSj2ieSz/ESOQq2FaL1Ehx+pYCl+cdZk9BU9BMDkxKK1qq0yHjSpLru6gAxIdxqCDsshm0FRe
	7gQ483EnSH7GCP/3ojYlr/ZNuJF55c3OD9M9kLcn2LOgtLQ/RzwarDepI/xMpoNo7ctaTQvg0Ae
	+yjlGK45gHr5W0//ipaDrOvKNpw3XeuZs5gpC7OtLHxfi8EU8MKNMnWFxJ5bvgVHtjFg9ZpZy0I
	BAXuNsU0e8mP7lKrptdf3jh2js5UvZYqs1gswwlOw20+hJlehGdFwL7NXTgQnCyMGof9izFm0nD
	uiosPQUS6gX8vq2SZ3YDlS1/JYpA3RjRNFpzspyQ9p+uqoPwMPsA4g26N3BeUAuKRoAQmx57VY9
	O+duxoyRoxbjV/ejJhcTH5AkxDhYxoIBmOphYylJChz6PzKd5D35TBg3sy9w7MVzVcxssI12dJW
	Cuj4R31dvDnKoM=
X-Received: by 2002:a05:7022:3846:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12a72684aa1mr4380934c88.11.1774230895127;
        Sun, 22 Mar 2026 18:54:55 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:54 -0700 (PDT)
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
Subject: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:25 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7419-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 48B8D2EBABA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to=0D
using class_find_device_by_fwnode().=0D
=0D
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0D
---=0D
 drivers/net/phy/mdio_bus_provider.c | 4 +++-=0D
 1 file changed, 3 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus=
_provider.c=0D
index 041576eba47a..ed3cd9a37c67 100644=0D
--- a/drivers/net/phy/mdio_bus_provider.c=0D
+++ b/drivers/net/phy/mdio_bus_provider.c=0D
@@ -21,6 +21,7 @@=0D
 #include <linux/mii.h>=0D
 #include <linux/mm.h>=0D
 #include <linux/netdevice.h>=0D
+#include <linux/of.h>=0D
 #include <linux/of_device.h>=0D
 #include <linux/of_mdio.h>=0D
 #include <linux/phy.h>=0D
@@ -754,7 +755,8 @@ struct mii_bus *of_mdio_find_bus(struct device_node *md=
io_bus_np)=0D
 	if (!mdio_bus_np)=0D
 		return NULL;=0D
 =0D
-	d =3D class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);=0D
+	d =3D class_find_device_by_fwnode(&mdio_bus_class,=0D
+					of_fwnode_handle(mdio_bus_np));=0D
 	return d ? to_mii_bus(d) : NULL;=0D
 }=0D
 EXPORT_SYMBOL(of_mdio_find_bus);=0D
=0D
-- =0D
2.53.0.959.g497ff81fa9-goog=0D
=0D

