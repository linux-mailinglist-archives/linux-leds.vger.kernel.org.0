Return-Path: <linux-leds+bounces-5356-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604BFB3FC75
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6324E3353
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29977283137;
	Tue,  2 Sep 2025 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGKCytNI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8927FD6E;
	Tue,  2 Sep 2025 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808974; cv=none; b=KocddOi9tfU3t2EzpBm8blj6CWK6mvnuXNrpfkF4fzr0sj3n4QO2ii4EtO2RgtTykI+G/awzDrzjoXmuz2UJmXCm8PV7rvt62rqeyQBiIm7ZKgnqh5GhAvAIVExVCpaVOn0H4PD7AvaeZlhVoDQpnles9QK+3ubSTRoLCySjFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808974; c=relaxed/simple;
	bh=uRsZ+C5WCQAcFKlUzOAFgpNtRdJuRvUB18EfocZmZW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AdFLPtEVYTnTGgUtJyGidSnY2ON8v3yvfIPNX2Bm1YtA1CzfsucEMfBeZJsC2wQpmsjxT02SbEkpa6yX2XNehnkmgSsPp3Wvvp4zVShBtCtWV1x5G56FmYUFOQIvTAlDCHbngNLChNsM+a5v74AdiW317PzXKbplokJjryE8SYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGKCytNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EBEC4CEED;
	Tue,  2 Sep 2025 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756808973;
	bh=uRsZ+C5WCQAcFKlUzOAFgpNtRdJuRvUB18EfocZmZW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hGKCytNIfhcxhmIeNUO4HsvI1Ws8sTNPVBiyj1780+x60m3iu7txa8L56s5KQgoyZ
	 Etl6s0WgN0LwdNEOBGmvkEzRPFnqNg+iDz9m3zQc5GyXibcbPDiU9tk8EZpz0VKlRM
	 abiMa5b3P0b6/fGWk8yjTzQz7CTQQ8IyFHBMpV8rokJs0e4kJGdAqh0WwPaM6vvnl2
	 InXfJx3A29klQJJgHD663mqouyweF/xPPRATt9QsEe0vqBBfLGHFCWCq+l6jeKWjwO
	 vyfZAT+ccE0mCcOJFz5pYc1+xikB2JubBGIKUvbPWd44pKGm/S56o2Dx9dYznuUpVE
	 W5xk0nQB2TGxg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
References: <20250811-dt-bindings-db-v1-1-457301523bb5@linaro.org>
Subject: Re: (subset) [PATCH RESEND 1/2] dt-bindings: leds:
 issi,is31fl319x: Drop 'db' suffix duplicating dtschema
Message-Id: <175680896973.2257460.6755059243558136636.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 11:29:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Mon, 11 Aug 2025 15:54:03 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      commit: 19c5010e8ae23faf7b98fd738ff9970bb9066b78

--
Lee Jones [李琼斯]


