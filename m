Return-Path: <linux-leds+bounces-6255-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB79C75093
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 16:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A1624E6858
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 15:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCB5341072;
	Thu, 20 Nov 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7cjxkBN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DE332EAD;
	Thu, 20 Nov 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652338; cv=none; b=t1OG2HJnMNik27rWIGVkci6+S3E6Cf3kKDO9t3pLPoCyLHdLgFYmiPNICAW21LQ2H5/Bm+8Ytxx7q9SY6PYPkkqUsJnw+xYc0g144p9Td2bjx2HlQL9uz2WqBnDwZ+FR5UzmBBpUSPpPJzVNGoTBt8gG7jcG9nEtbMnL5m7PlB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652338; c=relaxed/simple;
	bh=nWThquxamoFflq7KF0r/pPgR07P9ssgz8ujdMf47B/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gs+XeulC0fcqz4cHYTv3eZGjb4AfaQHJi4jmsTjRSkhlKNl1+Uitg+BYrjMuvJf/SXf286AsRLojl3R3Td36KCNbXUlXubjSnck7Ppw/OOy30J3I/lFp9oCG0dHK1mY38bkvWNOGADTjUHGFgs+r2aW2j2RSANO+4wCxPBXb8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7cjxkBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F5C4CEF1;
	Thu, 20 Nov 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763652337;
	bh=nWThquxamoFflq7KF0r/pPgR07P9ssgz8ujdMf47B/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W7cjxkBNoJWb3EJyBVOoSX12btyvCAxDaxhjyUbT1xK4WDuJ9LmTotBXb1X+frGkF
	 lYYpWrXQlxhIgMVtfVPv51Osdep37NHfIO/dVDYkejqCgvu/BR7n9fbGRGGOKaBgm9
	 dujZSrZOEyDpYjonQ2Su7gEh0dewfOz5VqxPAM6jjPecDXSBnPT4xK7jYb18SYYJrL
	 7LP+L/T9wgCKq6jWbODBrvuFtsiz1vF3UgJcKnLHkzMYtaXm2b8la1t65TEnJWH7J2
	 kQj98p/OsoEermNZu0EN91EOMLmnkIL0E2eUfQRtHfNDu14moT/UNyVHDBQCsn2pwD
	 K9zCW0i2jfdaQ==
From: Lee Jones <lee@kernel.org>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
References: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] leds: rgb: lpg: Don't enable TRILED when
 configuring PWM
Message-Id: <176365233461.759764.4308118661859596744.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 15:25:34 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 19 Nov 2025 14:06:41 +0800, Fenglin Wu wrote:
> The LPG channel can be used for only outputting PWM signal without the
> need to enable TRILED. Update the DT binding document to explain that
> usage and remove the TRILED enabling register write in the driver for
> that use case.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: qcom-lpg: Explain standalone PWM usage
      commit: 5d390e7a02e850a995ee25248292d4be61314078
[2/2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when configuring PWM
      commit: 072cd5f458d76b9e15d89ebdaea8b5cb1312eeef

--
Lee Jones [李琼斯]


