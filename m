Return-Path: <linux-leds+bounces-6676-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A6D3AD3F
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 15:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF2F300E032
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E559337E2F8;
	Mon, 19 Jan 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDu7kuHC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3337BE63;
	Mon, 19 Jan 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834318; cv=none; b=Dekr3GuHzNh0R8Uu8KqxI22TrzLOgK4awOo6DyipPT7xpcCG/6TlQ47SkfAoq8mde6aKHR0Cbc9Vwrr+oAEIyPDmeTMZSTnXZwaF8oZpHUAudtTeL6B1KrUOY+1L2CkvhxTx66Z0FHncxxy2TwC1lIO5KQ14wKpcjg77eUrncvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834318; c=relaxed/simple;
	bh=xXObY9gUyfmEV5Vk0XguZCdWJLEDIUujHIV/cNmG2aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDECihxmHl1r5zLUwB+hFz+9KI1gAETpnOejthU84ToeI2j2qyMNn3JBOt1LFYyMCMLEu9fkSZJWI8yhMMMJjoGQYkyqPdY804/XRcisVB93BIECTFQtxBi8KoGKfJlAfycrcbvj8GBcOCXa4dkWYU/ppreQpPCzpLL8KT95OqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDu7kuHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A38C116C6;
	Mon, 19 Jan 2026 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768834318;
	bh=xXObY9gUyfmEV5Vk0XguZCdWJLEDIUujHIV/cNmG2aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDu7kuHCLcfwiL0kucZol2ZsZnoDAcanuLn3giF7e8cRJm0WioEUodgcC+wS8st0x
	 3cbyk3W8+qwSOdyNJ33gMCWhu1m6XGs8IsckrhJ3kTyH9QlnWbiNdFLBwkm8d31VQF
	 sUTgK4nJcw/iACAtbBYTGQMa815xx1MHa/PrJQGnmd6bqoZHn+nOdekVif4vb2IKxL
	 3wNrX06O1uAMVUxrAQjV3mROTCw088i8n1FmqhuzLWUsNGtZD6LYeTaKxkyz6qQLlY
	 KRJtb73EU+5f1Xa/wGZUD8FzQ2yARPC5o1EaomxfZuuFbfeqSs9ydO+ESvpgKFtnEO
	 fitnDiISPy2UA==
Date: Mon, 19 Jan 2026 14:51:51 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Gianluca Boiano <morf3089@gmail.com>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
Message-ID: <aW5FB_ssGc9t3xaF@aspen.lan>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-3-e6c93de84079@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-pmi8950-wled-v3-3-e6c93de84079@mainlining.org>

On Fri, Jan 16, 2026 at 08:07:35AM +0100, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8950.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Thanks

Daniel

