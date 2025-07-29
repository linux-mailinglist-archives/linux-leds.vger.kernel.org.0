Return-Path: <linux-leds+bounces-5165-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D0B151FE
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 19:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89335188C50C
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 17:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CF6293462;
	Tue, 29 Jul 2025 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="RHXZcSIq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA3145FE8;
	Tue, 29 Jul 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753809548; cv=none; b=ZMmYhH/8jg0W91+M6DXIWe3+XDphxCopivcoIYxI69jKXdDSRCAglj6i42DwOLvQi8V9bpd0PP7RsL+RYHeI1O5dy0A8e+ESLhiuKMl26JpIW58gvM+Od5bJ0GAzUfXwKEhVKcMpjlej7eELNAJnQ7NK5bJWr5KJo5ek9VQ8bg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753809548; c=relaxed/simple;
	bh=wjHJkN76xZ9+6Pej99kANjeJrfM+//U0Dq7FGLrDcTk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T0i36iPx4RyRqeFgCb9V4kVAfxBfrZ+nGzImddQg5GEWx8Mg1PeXERhGzUivzgeTVWRNNAf2Fpy5rM8JdnN6GrncXDoyMjChjbGRc2J8mMsE7px575kuqW1L3OtMeWjZ15I3rgI3d4A7flT7+mUEhZmSJiYIePLAF9wNElsj0p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=RHXZcSIq; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=d03/wWoZaW4ksV5PR26r4aqD4rRo/KHEvjwMt78Y6Ss=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753809528; v=1; x=1754241528;
 b=RHXZcSIql0aq2ed4UX/XfOo3Elf6Bk1AsVrRZI/vaGtDxN4ne/uqY9/odZ0p8VZnnUoSW0ll
 h13iL08zJhVIrh4SEUhaOA94ILTs9FgQE6LVGBuaa/gY1222fX4vpeoJffJjuwhUvpS1Z6IPB8r
 dQB95de8/QXMCFihHltfJQSUFP61lbzpRyK8LfP+ti32CUtXIDJ4tZx2yMI7bXEfSambsZJLsAX
 0pnr5+ih3rRZhkf/gquRiDU1s6AAAUcNFv8ugFXOsUWINyHDMoFwvzsw1bj0PZd5v0hrt0dkVhS
 cp7NAVWjGOtQdR9zTY9EoR8A3bpU0wZDa1o/MlYZwGftQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id e1aa4e3f; Tue, 29 Jul 2025 19:18:48 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: [PATCH 0/2] ExpressWire dependency fixes
Date: Tue, 29 Jul 2025 19:18:28 +0200
Message-Id: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGQCiWgC/x2MQQqAMAwEvyI5G6gVsfoV8dBo1FxUGlCh+HeDx
 1lmJ4NyElboiwyJL1E5doOqLGDa4r4yymwM3vnGtb5Dfs7EqrckxplPXORBig0FihTqicCeZtj
 8V4fxfT9JWuo9ZQAAAA==
X-Change-ID: 20250729-expresswire-dep-fix-ba5b8bab83cb
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=wjHJkN76xZ9+6Pej99kANjeJrfM+//U0Dq7FGLrDcTk=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmdTOVPTn2rZ50TvW5y6lYfS0np5Nvvrd5fe7zv3DGHx
 sOb9bbXdJSyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBE/pQwMnyKXXpItnL+CVXB
 iGiT59d+SMeseeQWmh1g/q6iYZ37bgWG/w6uhx08ilh8Lra3rTo2b+l9mU0hrjeOrj0hLl15v+r
 BUjYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

Hello,

This tiny series fixes two dependency issues with the ExpressWire
library and the KTD2801 backlight driver. Thanks to Randy for reporting
these.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (2):
      leds: Drop duplicate LEDS_EXPRESSWIRE config
      backlight: ktd2801: Depend on GPIOLIB

 drivers/leds/Kconfig            | 4 ----
 drivers/video/backlight/Kconfig | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250729-expresswire-dep-fix-ba5b8bab83cb

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


