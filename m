Return-Path: <linux-leds+bounces-7867-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OULNLgc8GlYOgEAu9opvQ
	(envelope-from <linux-leds+bounces-7867-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:34:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79247CC9B
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 970B9301039F
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA7638A292;
	Tue, 28 Apr 2026 02:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgOuSeMN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E592D7817
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343653; cv=none; b=Hfv8L81Jzu/IZBxMQ8v6X66xPwxoxXIw5DPHBKPkWy3TeeRbBHwywrVMTgAhXVUcsI8V5+Wup+420bucwk3hifEV1vn+vQFiLGh/s4FKY6m1zsmcL6U1iywjCm9xvZcH6692JKGBdNFuu7OMhvma67O2xkuXVgcIxVChsAOz6fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343653; c=relaxed/simple;
	bh=B2NJzaNjCJ0DyQe5Mzm2TtPc+J/lHI3Q0EjfI8MXkQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtQLdIkhkT8xAdj5ZhVXe+ezScVv6OBsy8eQGfbEGA2m3hJpJeIbqUlu+rrnkPcKbsWD2VMXKzrm9V7OZBwh8P8NMMxaLvQ0F5I9Vtb88DZ3FgHERAxyQ5RPj2qRnkXk7mje29f4V35hujSgKYRGAuI1LpcUGl51TxBEFq+RNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgOuSeMN; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d891442388so917211eec.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 19:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343651; x=1777948451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xT34PXRwCoPIF5vxgIxThc3YCrZamZtv7P8orH77yuA=;
        b=GgOuSeMNmtJwMwbMhexmiPSPtEI0WhyahRbDVtKtkUWbJrBYm+zQY1H3+tKQYr/tF4
         ts332KbCgwU1zu2nCdul0j8DdeRfVXPKOS9kOh3XEtA+7c5CHE41EO8Gt7vhGcue7014
         SiW2dLNcwJI0363nXdOfzHAnw77V8Uy7yXsqf2CsCRaa5qwe9hKAVJ3ZqYx3N9Mrf0lx
         sB2gP4mQRllqL2S1Wv+vUaFXOm+dGHCDtrhA3qZRwrPQtmIFx1Eg8oaSbseOVVRWZXpQ
         5vInhNsrnJ7VND9gnkbiZcQPz6zT7+ao51jc2/Vwer7+gj74ezJWHK1elJfqTeZFixRe
         aqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343651; x=1777948451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT34PXRwCoPIF5vxgIxThc3YCrZamZtv7P8orH77yuA=;
        b=gvWs+CB9dHUpA8C/ZK4KQjl/AV4C4KK4g6JiEvylHl137g+9C2NaWS6YskJj5cENrH
         YMVpTJHQ0O66W6UiJRphYpaYUxXj7kAtxc9UdNEdqqaX6DV8QT2wgLuq034eyqUF7dQI
         jNhPi/ypbIMDKqotANdtvkPUMmm84XwVYLDuUsGLl0AdcWmvIT9uew4djFq7Ac2bNi/d
         /roHGl+Hy/o8vIeryGY1NaB2FZtQfXkneST3z6iSLKG7D9qFn/fqlNiMK4H5l1IB9VkU
         JSE511VzJBv7iRb6ljRUeoRpLZl0+/y3l/AHTnT108kSKJvj/cnZDtvvO/1sd1/5B3ru
         eUaA==
X-Forwarded-Encrypted: i=1; AFNElJ8ftK7Ug2WrUIZFDiTR2mujitAnO/folw9TeREKt2moOJln4goljCIlyAAM0dw0ah4D67fVI2tWLGdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YycwEVRW3yFAugCnL+uzCr5+UnPrWlR3LY+HS+21aEq7W0rf7wy
	jefYrweH2SgZvtQqKUVHtDaOYC6iRoylD2w0ihaPT1dS4jxS5bAsDv+Y
X-Gm-Gg: AeBDiev/imjeCf/z07dn7XayJNuhXJHFl5w8lE1hNYGFn1nI4/J3QTynlXFNWOaifcB
	4Kqfj/QO/tgG+qqmjIc9Kdu0Q3emL+Un0PU+raApfTTbZdfBXRs+moZ1k2JxwOhVcpoOs/xUN9M
	xVPIlxYhEE3ptS6E7PiWAolmHBBWv7VA8unSidqmH6k2qvG7krey+ykk/DOwKQdRC7lajMmlUVa
	CESEV0kfqBUu3BEUSWXc771VOtEEwvGQoHOEL7/K8z8x2g9SULhtXOebbn8nkizeoRcoI1NXm5P
	/ZcX92atMz/ftF20FJYh15bTpuPUiqlZmnj9VS4+vUK+N6m5SKltFmnhhxMdLo+T3ttwMD41GHp
	WRFT7ItLfByoHcPpqWW/T6EHzcNtowCAD3xbVQkslfSiv42l3Mi89BlxtC7hyZHMiSsy04aO0h4
	UabpoJJamp6CQMtDnjNOC6qUS0YlXDvNY=
X-Received: by 2002:a05:7300:a148:b0:2ea:ed3e:d0b7 with SMTP id 5a478bee46e88-2ed0a09937emr738460eec.18.1777343650867;
        Mon, 27 Apr 2026 19:34:10 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:10 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 0/5] leds: Add shutdown gpio for is31fl32xx
Date: Tue, 28 Apr 2026 10:33:56 +0800
Message-ID: <20260428023401.330308-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7C79247CC9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7867-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[controller.it:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This patch series primarily adds the shutdown-gpios support                =
                                                                           =
                                                                           =
                                            for the IS31FL32xx controller.I=
t also includes a fix and                                                  =
                                                                           =
                                                                           =
             dt-bindings updates derived from previous attempts [1].       =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                          Patch 1 and patch 2 are based on a previous attem=
pt [1].                                                                    =
                                                                           =
                                                                      The d=
river-related updates in patch 2 have already been merged.                 =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
        Patch 3 and Patch 4 add support for the shutdown-gpios property,   =
                                                                           =
                                                                           =
                                                    which corresponds to th=
e SDB pin of the IS31FL32xx series chips.                                  =
                                                                           =
                                                                           =
                     This pin is used to enter and exit the hardware shutdo=
wn mode.                                                                   =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                  Patch 5 fixes errors introduced by previo=
us changes. It impacts                                                     =
                                                                           =
                                                                           =
   the brightness control function of the IS31FL3236.                      =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                [1] https://lore.kernel.org/linux-leds/20250723-leds-is31fl=
3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/linux-leds/20260428003412.322032-1-je=
rrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
  leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   7 +
 3 files changed, 207 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.=
txt

--=20
2.53.0


