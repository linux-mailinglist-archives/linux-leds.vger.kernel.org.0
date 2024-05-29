Return-Path: <linux-leds+bounces-1717-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A648D2A66
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 04:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D4D28BC8A
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 02:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488BB15CD75;
	Wed, 29 May 2024 02:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWvREqUP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F415CD4C;
	Wed, 29 May 2024 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948138; cv=none; b=fCDOPfsO1oPHDPU+a3B1mozHOqzLd8ovGr4HyDUstXfi3viCraLoKktj3sLWehVc/Cm4GLIP61VKsH3T9rC1hvyhMUaZ5CL0yVB4c6E07JrVDEgjTYTz0Ntr2uwolh+D61vJtFNtj6HZSd/TZWsvVtUMAQ/isAF+bBfufXHiRO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948138; c=relaxed/simple;
	bh=WzM1bY4byL4YUXM6AADhK0X6YuFPtIN4jhP8k24IFpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xoj6GQxrkFGtk2ewHSdbkFQSJoyTV9WbsApErSu/2TC3e5NuXVF+Ncqcujx2Stuzc9YvbOu+ZVyhDjO2aYBTGXAh7d/1HXU364vN8YxIqwCI1m+/OS4HREquIY+yeq+vMoD26pCj/Ut4i1Ce8ThwLypWT+blFsADc0mjm5NHus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWvREqUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1516C4AF09;
	Wed, 29 May 2024 02:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948137;
	bh=WzM1bY4byL4YUXM6AADhK0X6YuFPtIN4jhP8k24IFpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWvREqUPpgsIjTmg1z6r8R0G7flnMe+fuxGSgmaIHVM+OczV6QcV1N20+YpaHFkDN
	 Wjef2915xGIMwQJhUX/sySAOzEiI7OvHTWUwzQ0FG7CcpE4rW5e5jiejrYlPebpTqq
	 Qz2j0Wp9CKPpQztflL/DwFcgT6jn8BTGeAjQfthCVLfux3nVtQhU/bBCN7keXazI38
	 8PhSBeedzOKVp8iXHZQiSCna5oQA39mUIIzlm6bW0XBUqquV2YSK3AxUgLA4713160
	 ROnk48xYiRTKLjN3ETcJPeQg1k8cAANAJyNsKFG7R4uD1iiZ1mY+g6lBI10RA/FQLf
	 lfbK1zbhf4vPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gianluca Boiano <morf3089@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] This patch series introduces support for PMI8950 PWM in leds-qcom-lpg.
Date: Tue, 28 May 2024 21:01:55 -0500
Message-ID: <171694812071.574781.1418783685100932942.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402-pmi8950-pwm-support-v1-0-1a66899eeeb3@gmail.com>
References: <20240402-pmi8950-pwm-support-v1-0-1a66899eeeb3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Apr 2024 14:35:41 +0200, Gianluca Boiano wrote:
> The first patch updates the device tree bindings for leds-qcom-lpg to
> include support for PMI8950 PWM.
> 
> The second patch adds a pwm node to the device tree for the PMI8950. This
> node is found on some msm8953 devices, such as the Xiaomi Mido, and its
> inclusion in the device tree will enable infrared LED functionality on
> these devices.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: pmi8950: add pwm node
      commit: 62aad66b57466287925d17e7ed0f6f14fd6c5459

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

