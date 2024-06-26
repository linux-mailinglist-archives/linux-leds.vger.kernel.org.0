Return-Path: <linux-leds+bounces-2149-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627F9186C3
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6F871C22930
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6253118FDB1;
	Wed, 26 Jun 2024 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctQar+2m"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B38E18FDAF;
	Wed, 26 Jun 2024 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417728; cv=none; b=Ipz5fHNxer4dcKekKMqr2T3YUAIwpZWog8+jszxgFQu7FhRtv+53b3aK+JcAXHnSGsRmq8VtPUSiEWppZTuyKCxD9xAuH7HxYy9Gfw9tfdBuK6zvPC3TLLMjMcmocsksejVXrkCTF2aYuyA6zoFm9gMuZsNFini1JnnG99FhXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417728; c=relaxed/simple;
	bh=NkNUoH7PH+wvdzx1J3nfu698r76uEJurORUYg1U5GGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YDs0Ml8c1IVJVEO9RAg0p87QF4xXfp5KsPneDiJho+27Gi0K548NcLDtuIpWwMugWruCQATvaGfa3nM0OutfrfYbue+rawPhnHGgojXmPAZupNzUEMRzq2RLJAoHWfQfJTXEoaNR8gOpdIbhYMRo88xNeVAkZHmP5Cdkg35Eibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctQar+2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F79BC32789;
	Wed, 26 Jun 2024 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719417727;
	bh=NkNUoH7PH+wvdzx1J3nfu698r76uEJurORUYg1U5GGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ctQar+2mvvi0orc/Sa0k87jKvMsvw0WD2udMSLDtcb0l1XAP7thtRL6lC923qpA0H
	 OVmDU3QGVcqbQT0H3XFDmGCCNI3iss6JG1s3Wp8n3mlQSgMaSdCdwUEo8QlF+8IHGk
	 kVbaK4kgTI9mvlac7sJfDvKenkku2+fYGe3tPj1ypspM2Vkz5Cl0wRK13na/EtqB+X
	 aB0wsoZoFyPI61GeLeMPN4H+kqWML3DuK5OojXo2TcHqUxXFwIFXpdx+6ju6JN5wuV
	 j9UCosJXJv1DWhKBp+GfhYs4phAyiIGvRC1rGjcBB4geovEfTIefJIxBBcrgNB6r52
	 aUXpG/rCpm7nw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org
In-Reply-To: <20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu>
References: <20240624-sy7802-v5-0-7abc9d96bfa6@apitzsch.eu>
Subject: Re: (subset) [PATCH v5 0/3] Add sy7802 flash led driver
Message-Id: <171941772410.2536029.16123233056884497719.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 17:02:04 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

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

[1/3] dt-bindings: leds: Add Silergy SY7802 flash LED
      commit: 8c063929fe3d24d9c2c9544d1c1e2add4190b80b
[2/3] leds: sy7802: Add support for Silergy SY7802 flash LED controller
      commit: d0838d7c837820733c4e6b9c6d16323d307ebd96

--
Lee Jones [李琼斯]


