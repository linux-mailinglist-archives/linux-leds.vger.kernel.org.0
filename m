Return-Path: <linux-leds+bounces-8047-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA/aHRzh/Wn0jwAAu9opvQ
	(envelope-from <linux-leds+bounces-8047-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:11:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C94F6D31
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 536A9301DCE4
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3E9330D4C;
	Fri,  8 May 2026 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuBy13Cf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F33E122B
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245913; cv=none; b=NQm/zwtkKPAXRB7BtteVk3IvKQWlv5kosl6tzNfqdAKuU39xbtP4q4/Royk05rGTKlcioSCjqv2xpFG5fTw8w4kZno+wMPmjdatyw8v9qUCpBBYuHBNFh6kDtJVzBDKFedn3Vfreti2KrBN4bBX34zpeI4y30KOXr7oe/Zw/dqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245913; c=relaxed/simple;
	bh=9HHz+PZmIU043XQ7rom8DlX5THuo9509KC/LsRGto/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nubklrnS8T75Zw1+T6Ch1esUYGkXfKk++In7/42iomynmD8YZ2VEvnrEnoj8vWD/As/5NdFAn9YjUltq5vhGhNQLJSDK2F7sVpIbWURPeF0MslJSGpWHelp8TCTNwwu+a3/8U86go/dVJ1aJLPpZ4ogCFUSBXTGi5u+gBf5LMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuBy13Cf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1468408eec.0
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245912; x=1778850712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95h3r9WDN8xYbN8MdzSzqWBs85R0XD938YswTTlP/Fk=;
        b=FuBy13CfrTxB8Ntpgp2HWX5Lbx8dQvTS/dqxpWlnvFPR5RRVw6mAImZa2O3ojwkYdx
         4to2I0SOsBNGlK4MGCrRCa1MF6pYOkcoUJgTgDn7Gg4lzlwdf7GOX2Q2OAlhKUYf6rxp
         r+VXYqj7XyBvCCI2dexku1fpG6PocAjR4Frzbxf4VDAMtmD6YyfVeU2rt8iQmBy1QvWF
         jVxmg3d1sde1SFvbeELucG/QU2OnenmkDBX27mMitXAct8YDGoCjLl68asUUc004ojTp
         2ZLKUYsqTQNm/++I493SMN6sNBJJRzr/6pv+8Dgz0syB+UX4RcrkMtZh/XLonojVufUI
         WSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245912; x=1778850712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95h3r9WDN8xYbN8MdzSzqWBs85R0XD938YswTTlP/Fk=;
        b=rp7Z4PJVmX8DtDlfqg5tZViL73iyrdY5tWboATVD6jJBbspI020NrvCFC/qDtOg5Iz
         zoHj3SLCLRsl18teUxeMuUtwJI54g6Y9HGdllkf0aIn0z4kB5GDuh15zexQ0mbUeZA0J
         I/P69i7cbHcc+pWpY/qjoUzQYxKoSgHLfU5UVSBEI9gM6i88e33nlpt31w4PhhVTcOIm
         wmeI5eVLG5lX+eGKMJagLLi0taWGxsoj5wyaglj4oWDhVHih/hDeeuTMrMTTAnidtOhp
         7T2GLl06X6Z1Ue4KcGto+KAR5/yFb+4cS8KPXFchkRjhjxNKdfWtxDbs4lIkyChkZb6p
         5VKA==
X-Forwarded-Encrypted: i=1; AFNElJ85WsIyAp1za8xJw8XvOJoZTyi55rq+GBj9QQlPvSDKsudSz3lrMeTNKL+iAByCw0TnXiSiMAatLO9r@vger.kernel.org
X-Gm-Message-State: AOJu0YwQdHDReHFmeg/ZqZAdukzeFrex0OtFaIRh62WsOfgdGGxrLmt8
	h3blHNqVq3YJlRP3xbT79h+ur5hPbA8nkDzATYjfXSEezvulBP4xleUb
X-Gm-Gg: Acq92OEiuzCv8wyY8gjITWkW69BSkSaMsTw2EOiyDmgMPJOLDglfihNKGxMFrn4OvB/
	yNfoLkBXctTfeI67XaFLZGc0CBT3FwK0bggVhGbqWAdy8YdaWMZjoXQCHvAH+CPZbqPq4tc2zsZ
	RV0mrjixIS+vmcGh69bq41vZrYwb6LKZfe8AnKl/WJ5IsOCR5cabcPSQfKPY2lKdbQKUUOhJhm7
	i+NVV1U6BZBBNQhiy02AsoIcaKksXYbI4UgejEqig42UrG0ONMpuTNXEZlVQyga/+wTBwrrOz87
	WHIIpHwMvvJ01ZFjw67u8p0kBiE1x9ENS3AUZ7Pwe3AWOWs5KAygbG8pb5oxKeMbylTqNUge1N8
	ErnBPL/DwYVE3NUEaZLqCdbvVLz5zXi0OAz6Io/pkpS/Dz+//OFwHBXx6KVyrUglKiriX46cbHW
	lSn4YsZPci2oYCgRJgMw==
X-Received: by 2002:a05:7300:bc83:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2f6debccf9emr2873444eec.0.1778245911455;
        Fri, 08 May 2026 06:11:51 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:11:51 -0700 (PDT)
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
Subject: [PATCH v5 0/5] leds: Add powerdown gpio for is31fl32xx
Date: Fri,  8 May 2026 21:11:34 +0800
Message-ID: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CD1C94F6D31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8047-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v5:
- Adjust the unit-address in dt-binding to hex addresses, and remove unnecessary if/then constraints.
- Link to v4: https://lore.kernel.org/all/20260505145354.1267095-1-jerrysteve1101@gmail.com/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   8 +
 3 files changed, 195 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.53.0


