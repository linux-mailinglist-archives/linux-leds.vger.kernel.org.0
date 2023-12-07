Return-Path: <linux-leds+bounces-303-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7EC808BBE
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 16:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F438281BA6
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 15:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2BE44C81;
	Thu,  7 Dec 2023 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLNIWoTM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D53AC2D;
	Thu,  7 Dec 2023 15:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33CFC433C7;
	Thu,  7 Dec 2023 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962756;
	bh=QSRLw7yztCghjyxb/KELP29iYZGlYvVKvP/F2T64Jww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jLNIWoTMMlZNrMRCUjmXid2FCoRKOegMarVWk3xLK4aTFV6FBlgv5y9ie8gZ3gbjf
	 HVy1/YRb6I6hDXuOKp/2fMWHBZKzcwJZzNkVUiXibUjyVLsXfjZaOp0/uPsLciony/
	 bPDSlMOC4YH6hhKUJ0YA54GWz29VI+hQKM339jK2I8ACK55mC2wtoIv/CAiBg0wesQ
	 IjgWPLDNFODIZUsAlrxz91CR4kOzWxn4SfQFXsbJ6YeCvaZ/Gc1rsHDl87NCLtDxLa
	 Hyww8vRbvCLV66RcyTFs6hRxZws4Kh4tjak3En96dfuEfX5vKidCiRhJjyE24K2iP1
	 hcqEppM2IsqTA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, inux-arm-msm@vger.kernel.org, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231130171940.12391-1-johan+linaro@kernel.org>
References: <20231130171940.12391-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: qcom,spmi-flash-led: fix
 example node name
Message-Id: <170196275366.99959.4254922896810354041.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 15:25:53 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Thu, 30 Nov 2023 18:19:40 +0100, Johan Hovold wrote:
> The led controller is a child of an SPMI PMIC, which in turn sits on an
> SPMI bus.
> 
> While at it, add some newline separators to improve readability.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: qcom,spmi-flash-led: fix example node name
      commit: e9a3374e5c545e5eade4623098b958d2f4073455

--
Lee Jones [李琼斯]


