Return-Path: <linux-leds+bounces-5030-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29177B00E73
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 00:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8381CA1D39
	for <lists+linux-leds@lfdr.de>; Thu, 10 Jul 2025 22:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A7B29ACFA;
	Thu, 10 Jul 2025 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V51QgMwd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5705299931;
	Thu, 10 Jul 2025 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185096; cv=none; b=ZWqCIsDKsJmCsV4wd6w3svpaxAYKXS4EYs3kScs2zYtZ35QmgeUFarB0PgtNPamuWkF8hPhS+/WaoR50ZTabLP6dejLKCsTacOxZf/CGLdSJC5DXIyKMXN3zfw7vbc47QF/PwL5+Em5k+6mVwwyK6fAIYKqiSJHq6pn7exkb0LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185096; c=relaxed/simple;
	bh=yFNjl8kkfnk+L0rduGvEslQojIByRl4tqZ5g//s1IMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbW1aXEt+VVYXD68lcdfAoLWUVTw/6cxrozbET81eLs1pYM0lFjrphUyoNyZY5FQW7ZCLI2QysmqhACAoAlPeJf4jZwBf9WAEY/P/mId7HiPHq50Jkyzv+oAriYoWXqLDv3snb/eiBw1b4568y1EMl1Zl+eOcqR2i4RW0Neu43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V51QgMwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75449C4CEE3;
	Thu, 10 Jul 2025 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185095;
	bh=yFNjl8kkfnk+L0rduGvEslQojIByRl4tqZ5g//s1IMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V51QgMwd8xoXk2qcNBAKyEjA99S3Ez/GkY8S1lNenlZL7/P4j5EMRuEdrkVzhdVZT
	 yXh4N3ZRaCU7LUOHqV/TFdtWqra3/EpdTR4ibinrkgCYjTF+YUc3HK5fyFPQ4jorHk
	 V2MPLzVPof8EWt6fySDScoXc1tHV3CIb8fG0NcioJ2wPFjCYXOTLiDr3DXRbqsbEbc
	 +eVtiX4EkTjdcIIp1tOe59Hh0g9IEITMEhdg/1yIz8vlVLj8VxiEbvkRz2wQaoqvhs
	 ADl+4yGJoMpeqi2K9EBTgm5EZ2/9oPlvm0tZ6ez/LKSPUwNjlvV5sb3DlkWQa+5Djq
	 jay2Lwyfe3e0w==
Date: Thu, 10 Jul 2025 17:04:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
Message-ID: <175218509406.4052920.15579005352274451029.robh@kernel.org>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
 <20250709-sm7635-pmxr2230-v2-1-09777dab0a95@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-pmxr2230-v2-1-09777dab0a95@fairphone.com>


On Wed, 09 Jul 2025 13:46:32 +0200, Luca Weiss wrote:
> Document compatible for PM7550 Torch and Flash LED controller.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


