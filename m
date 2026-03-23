Return-Path: <linux-leds+bounces-7412-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJBUDmWdwGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7412-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:54:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D75782EBA75
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1BD830071F3
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5155121A447;
	Mon, 23 Mar 2026 01:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZihrLDn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D92139C9
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230880; cv=none; b=eLTtjP0uwk0YufogLSMDyq0aTlIBn1mm77GvW28v9sq5j4hIYfvmJW2EUR5U24JG2E8NAOUhc2ORyxjbiFZNbvpyuaqnXv2va2yPwQ/pM4xBPhmf2RMGrg8FRM5H5cP4G/Ydi1AGU9/EwcINHHb4Q13bmL0cl15IwEObhvJ83J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230880; c=relaxed/simple;
	bh=JUqh9KjJr81PA08LAGWLpc/TnqC1KKCJHttSUso4Mis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qBQq2DX8Rr4h6JKR40DxzLSlPgNe4c33Go9/11nH/TTx/y286Zpb/0SxwghPmO7eHzAIJm4njoUTcnps+lTJeJrXlq86AnM/9qDffo27upvoJu88Nurg+iE5pDdx+yDyQsH0PwVl2Qp4lq9cA9qsYzEHHjZAM8txdFA0t3gW9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZihrLDn; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c11c43aca0so882144eec.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230878; x=1774835678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFNqFKHYHzU+/IYMzEM9SYl6am5Pz+NCaLhPwszpQBw=;
        b=iZihrLDn3uemS80BJaK0ZbnZyZPK2nOhEbJEKP9Ll6ZnR//Egc8auBEu1gY8L7f5cE
         vGvkiZtql2gdyP16RHs2zH7kzoNOG7ofXC1iRXWSmSKsMyYNdGKTIolRt7xdondUtWAV
         BzjD/cMkNClaTXZfnu4Z4TliktptCHKPofnbghtnSwTPk+HJZnI8ZGovdU41MDyZqlGl
         ZhKPuG1YF0fHUflmZwL5ltOscujQ8xhH/ZXK+Qk6sMFvlSvfNudRUSFwNbCiOnkbxgQx
         XAVg0mXyudvTdU6egJD+nS/ZZstD/tcd7Pq3pSfv2CP+pCaS9NUQdfrM5BQmCjDdSSfg
         yuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230878; x=1774835678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFNqFKHYHzU+/IYMzEM9SYl6am5Pz+NCaLhPwszpQBw=;
        b=oDzP66KXUp4NpOk3WzNLDzn5D2OZfLGuQa1pZPj6duKiu57vli59+3wZf+gj5XV+tj
         w8yshVDw6C6h+NaCc/Tgzy2b8f3hPmEhm5/2t6BNyKZvRpbUVD3sxnmOH/9jSIhZJcB2
         E48v4ywws4cVzqnENGuAj3g7FgdQV5noIXZfcqL+XvKxmCMBeyyRNgByTQ9UDqAMKd6o
         8NwXsm1ViitgcapN8Wbq2sm0alazt7lbws8dj5tFWHnMu3IwVLm+jGbqOtAEH5aQ3jye
         IlU2BvKpzQJ/jWr6hpH+TrORZ+pptugfOeI23djXwatEJxAxIIMcnR2pBZ1ZJNDJJ6sl
         IquA==
X-Forwarded-Encrypted: i=1; AJvYcCX8mMlw6h0CGPbSt4Em9wWN0qHLs3O6LIEiaC2DPjn6WUjNkcNm8MGDgeve5K+KRc8yx2VgGX0DIeTj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88+rCT2PUFdnRxewLtTFzHZSoMbzEAdhSKiQMQ7+hT31FoFRL
	LjWK9ehLIY2LXkHaabTlermzVpLPAXGIE2/L84JbLMzg6ysA8GejR2i2
X-Gm-Gg: ATEYQzx+l1zfgOntA41ZJJ1gNu9AsR9gmEvMPPTXzuV0Ol/kPPCoR4M7m55G49f/hpL
	bENC2P/wTkLC+/2qqHY4GQ61tO2j91ufEwZKtM/9G0rfyq6ZABr3vdQpBnw0z2W3WvKmHoOJG3H
	BmmBH3fnVgcka+6KLVXXDGsFnfpzGkCU09bqm8cYTbdH2egliITdaHCwkrXN9h7L8BNJoI7YSX5
	Ahn1AhrgJkMtyyya62VaV66mZixijF4lWPpgbjaJQiuoLzx5UKW4XkwyIBZVC0MqlFwEcVeqZKA
	I54zBour0s3v3K1HBJc+WLdK1c727Rqq4dzTySC1yutQz76dnXHSSESoHEfpBUcVD1DkCRZ3Bjj
	2+jF+uKTDoDLNVJ0nkTvYCELA6LIShLwwb7joLDBrfX3sNJicDbLBNyDK4ShpOxyq8oNsRgl+GB
	qmHXwGhn68ELMmjQu8U/rqhDVox3TN5suSMK1iQobSqfyhBCAjzCRNg1bEnCPiCk3vsaBpFoacJ
	WdZeyoBMsB/Gh8=
X-Received: by 2002:a05:7300:571e:b0:2ba:a1a6:c73 with SMTP id 5a478bee46e88-2c10974ccb6mr3875035eec.6.1774230877711;
        Sun, 22 Mar 2026 18:54:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:37 -0700 (PDT)
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
Subject: [PATCH 00/10] Remove class_find_device_by_of_node in favor of
 finding by firmware node
Date: Sun, 22 Mar 2026 18:54:18 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260220-remove-device-find-by-of-node-077784fa109c
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7412-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: D75782EBA75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Firmware nodes are generalization of OF device nodes and generic APIs=0D
should offer only fwnode variants instead of providing firmware-specific=0D
handlers.=0D
=0D
This series switches all users of class_find_device_by_of_node() to=0D
class_find_device_by_fwnode() and removes the OF variant.=0D
=0D
I believe this can be applied through individual subsystems and then the=0D
last patch can go into the driver core.=0D
=0D
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0D
---=0D
Dmitry Torokhov (10):=0D
      net: wan: framer: switch to using class_find_device_by_fwnode()=0D
      phy: core: switch to using class_find_device_by_fwnode()=0D
      spi: switch to using class_find_device_by_fwnode()=0D
      regulator: of: switch to using class_find_device_by_fwnode()=0D
      leds: led-class: switch to using class_find_device_by_fwnode()=0D
      mux: switch to using class_find_device_by_fwnode()=0D
      net: phy: switch to using class_find_device_by_fwnode()=0D
      fpga: bridge: switch to using class_find_device_by_fwnode()=0D
      fpga: manager: switch to using class_find_device_by_fwnode()=0D
      driver core: class: remove class_find_device_by_of_node()=0D
=0D
 drivers/fpga/fpga-bridge.c           |  4 +++-=0D
 drivers/fpga/fpga-mgr.c              |  3 ++-=0D
 drivers/leds/led-class.c             |  2 +-=0D
 drivers/mux/core.c                   |  2 +-=0D
 drivers/net/phy/mdio_bus_provider.c  |  4 +++-=0D
 drivers/net/wan/framer/framer-core.c |  2 +-=0D
 drivers/phy/phy-core.c               |  3 ++-=0D
 drivers/regulator/of_regulator.c     |  2 +-=0D
 drivers/spi/spi.c                    |  6 ++++--=0D
 include/linux/device/class.h         | 12 ------------=0D
 10 files changed, 18 insertions(+), 22 deletions(-)=0D
---=0D
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e=0D
change-id: 20260220-remove-device-find-by-of-node-077784fa109c=0D
=0D
Thanks.=0D
=0D
-- =0D
Dmitry=0D
=0D

