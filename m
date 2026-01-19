Return-Path: <linux-leds+bounces-6674-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE63D3AD2B
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 15:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83FCA302C21A
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEE837E2E4;
	Mon, 19 Jan 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+ADaIPq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FE2241663;
	Mon, 19 Jan 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834229; cv=none; b=nkf1XfJdpxOrrvppyCecIl9/y2p99AiehySGqQS7ELBLuub3P9bH01DqqaPTi+E+Z1w9Xm4CkmaGo2izIUoy9mtj9GMdrdose2iXZqTwDSrADVgQqyAFibfcaKHWfcgMEJ9cV7UGOwC+Ey8eMFDcx1ft1FLQWN18uLUrOyXI3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834229; c=relaxed/simple;
	bh=kBJMtglm4EADgYcRAog6MoN8xl+2IAP7BGbqY3Tex1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PO91REdRYtyNq0IBeBgoVCk+KDslnD6qANS8Sr4CjyTFSmQfG2AYm4QXhe65A0IRFjMTTbqSOxYOspdOajaAsUMbkUIk/o3W3BWaeKTfQl0+OxwH5Nh4K8sG/WuNKJbclqIqvzTQLDZUD9rG4lIARAGCXehOx7P0StMrwxjwNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+ADaIPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE17C116C6;
	Mon, 19 Jan 2026 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768834229;
	bh=kBJMtglm4EADgYcRAog6MoN8xl+2IAP7BGbqY3Tex1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+ADaIPqVA/HftOFfer/+qK2w8wWStf5qsGOWn7XDpyWmV7JdV++gANVbYBagl2ug
	 Ti0CKeIFS/lwisMVBeo/2SmJhRfCKLPsghPCBgfGQsjR57+z3nRegjwTItrZGURTcA
	 W5i50gQXiq0yjY/eWnIGUen5fX8kuwKU6aHwptdEe+ZF3A9t6W+ksMclbD+sPVPhZ+
	 12wLcvpzC7sRBGAEEi57xUdeM2uLFEurZS7aFVcwM2au0eaH4PQaVjuvdWv51prhvg
	 sQUaOA1aHg4eJx0MsrQkzroiSc1wpqj1C3iNbJ/9YoulJWb2j1Ml/H26OquBwkZMNm
	 xljtTnkzJD39Q==
Date: Mon, 19 Jan 2026 14:50:22 +0000
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
Subject: Re: [PATCH v3 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
Message-ID: <aW5ErjvOuNigbdPf@aspen.lan>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-1-e6c93de84079@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-pmi8950-wled-v3-1-e6c93de84079@mainlining.org>

On Fri, Jan 16, 2026 at 08:07:33AM +0100, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8994.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Thanks

Daniel

