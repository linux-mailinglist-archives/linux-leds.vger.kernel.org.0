Return-Path: <linux-leds+bounces-8220-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJufIFnCDWr32wUAu9opvQ
	(envelope-from <linux-leds+bounces-8220-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:16:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BD458F692
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A09FE309BE9B
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1993DBD4F;
	Wed, 20 May 2026 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sts3xeCk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C5344DA4
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285436; cv=none; b=PAbqxmUTffWflih2ketQ5GOchJAD5zhy8eHKlOs7KAVAGvvMhAUXz2yZTV8K2s26JSCKvJgbLpJFdLBDpBCRfA6NP99DWpakMdkjki6v45dziOJyPXzQwuNR9foYwf5aETXs9D3qhkoRKMNFQBPAAM8ev/QEM+ITJoHxSDC38vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285436; c=relaxed/simple;
	bh=iX2stDNllGNaXxAzEr63ZeU6DW2vQE8l99f4osHDVWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQTNK2sjf9bjK3pVtXbTomkQ0b+O4PBjRm0d7yJECcj9XursSsA4FVXEWR4bsyWfdq1V024PyW11ccCDyGeX252VT0gehK3S01iJNjP0XmpBKKGk09EAxDSjmj59ALdG7zgwkULY4w/2xORl/zGKtUsHlcx5sdAqyF4Ck0qfmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sts3xeCk; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36a15ed5119so1358742a91.3
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285434; x=1779890234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzdqydfWAhcJI2PZ9QXniGvgDCA4JHzzz5KjR3IaDoQ=;
        b=sts3xeCk9Q59HWjeE+4PPKPLKvlhkJHjRo/wcuT8wtqvnnGejSWesrh+dwb+PzlJVI
         gScY2O+cvxfK44c/sp2WqrNg3GNBbrp88/RdaSDAyQGL9mmYJlKa4zfYBd1Si2rR0Bb0
         jD5msd+/JF4GvWG7XS/3OjuGwU8R5CGtP4b4xX9wYxxrPC+UtVH73FnHYqGAOO+c5Ayr
         MSzHwZEES5I3BG7rIqgylK2saxgD//4eMglx/kFFZPSfXlfRdJwqv1zUYumx2nvVnyXi
         Bb7VCHFkpdr7tZiw2IzqDz4dV2+f6/NI7LHliuS3fwnbNDtJVlUFPzvtJKsLo36uvF2J
         4IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285434; x=1779890234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzdqydfWAhcJI2PZ9QXniGvgDCA4JHzzz5KjR3IaDoQ=;
        b=b5Axwx1L9BBwVkFO2rSVnqb4Ou5RPZEYtRzeUD2cAVSt9jyqphXLIfOi+bDdUpV7Sf
         YONgLU9WL6rO+jRo5n7TsBnd9jvzQ8Ip7dxbHiknTAG32Dc4PNUdYeS+f4LA/76mAWT5
         zarP0MvUu/FpJHObkxh0Ura2JPxy/I8Pkv5uWYZ/rr7lByQMR/F4UaLQdP66ARY4fSIR
         3Ed0p+jtZsprN8kkD4pMTnissvWhzZa9Uz1Pudu1FVVrmPmCRjnUEeYM7gHC100dRkgw
         ENuTp3PsRM5BXmNkZytUzS3BDgDfy3p/bqJmMZEuWixL8whF6adq7WPO9SpoOyftPdNV
         qYXA==
X-Forwarded-Encrypted: i=1; AFNElJ/lqQAm9frmx8229W2UAuMB82a9GwqxIMClRK55PJFuYlYJtp0GDqqKlSPW9N0WGWgAZ2nOts1mi75G@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmyEBalqK6oXqoo9mjpeIfTxMUZl3DK6XMINBgAyQQblHjmuQ
	ino9oOqy3/ttD+eLm1U4TgT7wQV2zIwx0YxoEeR0if8EVJ290IVTFUdoLHgCb8OP
X-Gm-Gg: Acq92OEQwCDmCq04TBTGk2SIhCJQhiadPtY2vbyrMTgo3Px5cwozzB7s3g4yxQsWbvE
	msKSsTi/Ky7EPA22DDEwzkfDLw7/ynuri8tUjByR3/1iKcjLMHIP4yuBNDFjtKu7kI5sAOu8yNY
	XG4fnlEJcMtB/Dd0hpLz+1a3ckcCSUFXcXCaD8K1uEE/d6kLnNJplrSQskf47735H/4O4WmDF3D
	ptyh8/7BZ5xsRCrWAnfZdgH/RDN73Bn3rAgLkPfxw8LuZtbTzMsLi4yiGP7dBdei8fW7o1ywXHD
	HIKwsLAaWsQ5tPcv6kSU/czf/KCTjekfz77olqHyzO2PSZ5hp62XyFHicIKYoHs+tz64oaG+Kmw
	EXuNg0e1PafMRjhgNaVSy1YQxSUasVA/fijOxcIH2bf4rXEPFTQQKQGgNFZ/pzf9SldZxqMR3WJ
	NYdiQM21SZ7iTkPbO8n7LsxeCPgqYnAA9ltel9WjU=
X-Received: by 2002:a17:90a:1c16:b0:369:a15c:1053 with SMTP id 98e67ed59e1d1-369a15c12ecmr9317722a91.15.1779285434367;
        Wed, 20 May 2026 06:57:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:13 -0700 (PDT)
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
Subject: [PATCH v7 0/6] leds: Add powerdown gpio for is31fl32xx
Date: Wed, 20 May 2026 21:56:53 +0800
Message-ID: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8220-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,controller.it:url,checkpatch.pl:url]
X-Rspamd-Queue-Id: E7BD458F692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Patch 6 resolves regression caused by prior changes,
and fixes the 22kHz PWM output functionality for IS31FL3236A.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v7:
- Fix code style (spaces/tabs) and commit messages per checkpatch.pl outputs
- Link to v6: https://lore.kernel.org/al/20260520133343.1423946-1-jerrysteve1101@gmail.com/

Changes in v6:
- Add fix for 22kHz PWM output regression on IS31FL3236A
- Correct typo in vendor prefix for Integrated Silicon Solution
- Restore hardware shutdown state upon driver removal
- Link to v5: https://lore.kernel.org/all/20260508131139.1523597-1-jerrysteve1101@gmail.com/

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

Jun Yan (6):
  dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
  dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
  leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
  leds: is31fl32xx: Move pwm frequency setting to init_regs()

 .../bindings/leds/issi,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |  34 ++--
 3 files changed, 210 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.54.0


