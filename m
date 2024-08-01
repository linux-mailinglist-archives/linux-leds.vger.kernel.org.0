Return-Path: <linux-leds+bounces-2365-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAB9441B0
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 05:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFBAD1F22C2D
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 03:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED081448E6;
	Thu,  1 Aug 2024 03:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXwGz1Om"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96942D2F5;
	Thu,  1 Aug 2024 03:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482399; cv=none; b=dvUge6j2VmIMZzYhVibJhNdeompODQmVCSIkK63zI8jCCw3t/Tt952YCz6wBN3vko2oNbbD9Hmi3iHSxrJAT/6+pZCL8MJaABeF7GDTZ/on1AlF/oG99C95K1Xu+w6aF5ZbhrMrnFeD+Aammlq7nMuANwWFtdsjJ0uzKT0L7qTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482399; c=relaxed/simple;
	bh=62CvZFHiUZVVGVRnDRrYGgy7Qz4cBtl/5I+U/jVoanU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXggHzYMGbVcFmlpD9BjjeeLJES4Boh9AKpk3+cgy36odq64aF6wQl6ds6Pf7Z46SjPyuBU+2Ec3C70jR/xQlyZ+E2qMstkqZ5ypdvGrMYXP0HYX3wRFhmme3RPJo/iRil6tkj9US+HWb5x4SBYLFsvEkCEf4YygVpBKGz1zLU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXwGz1Om; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A282FC4AF0E;
	Thu,  1 Aug 2024 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482399;
	bh=62CvZFHiUZVVGVRnDRrYGgy7Qz4cBtl/5I+U/jVoanU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XXwGz1Omjc+G7UAb5MLMJYlGuQ/Atjv6QMmm9aFLIXDZXVWDvtp6lSSoIaf2NYDaD
	 XbLI1oliuYo6ooV9aCwht5nazRG781zMzV/qTem7RL9L6MDlc6+b5iNGjiv9jsKqZy
	 40ojVA1K8nKtnSPJ6EOJV4XXV03ZgwZeTX+DeCqD2VsSK1RZ5DAbxdCjsAKGX90BEg
	 p3KVAcvXl3yp0aiP7kmxFbctBnEb0Vy7R9AYcTGRpIy1mnEVRi9aHIyxQCQRCBX2r4
	 BVcpO21cHAS5Ab/UwxJDhqZHnfVwbT5w33wAWHdIco1OuC6qnWs8uQ3KUOksQ4FxCx
	 KrA3TA+TNGLOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/3] Add sy7802 flash led driver
Date: Wed, 31 Jul 2024 22:19:42 -0500
Message-ID: <172248238588.319692.10867242578610062893.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu>
References: <20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 23:25:11 +0200, André Apitzsch wrote:
> This series introduces a driver for the Silergy SY7802 charge pump used
> in the BQ Aquaris M5 and X5 smartphones.
> 
> The implementation is based on information extracted from downstream as
> the datasheet provided by a distributor of the hardware didn't include
> any information about the i2c register description.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash
      commit: f98bdb21cfc94cb7733a5c3216e8f1dec1c06023

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

