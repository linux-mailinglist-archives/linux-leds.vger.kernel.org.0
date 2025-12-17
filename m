Return-Path: <linux-leds+bounces-6446-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F9CC680F
	for <lists+linux-leds@lfdr.de>; Wed, 17 Dec 2025 09:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 019DD3024131
	for <lists+linux-leds@lfdr.de>; Wed, 17 Dec 2025 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11301349B05;
	Wed, 17 Dec 2025 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bamswvsf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD6349AFE;
	Wed, 17 Dec 2025 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959314; cv=none; b=m7Rca9P8qiAQ58sOnhKFysAHVQIQu2W81kC9mRWrrbHnYb4DWvIghn54woHtWpn1I5JelbnjGC49kQQYuD/Hrz+Nwxre25WLVEX3AXqgpiCSRN4TkK7myhc2vSpdRQnAVG/z/YcHyU3I8CBYFkagTRH1ZdlvpdC2mSVcYoPiwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959314; c=relaxed/simple;
	bh=2OafIiysh5+/QTm0bhByzlnf9H06b6KUh52r+eioDGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpWqdouofQG0NKzd3fSJSQLB7PdhZj1tkLFwdynVWA3omHX/cCppsnjrAGelTtzWejiXy8SCvYYRzwqs2LJ67NycVLQ2XkRXECyJdFwVSxgbgwwtRr2O1MNs8PItb19fGhaBGWvmdUGX5B6Uf6gbv65S5WnzNhzYAJSVJ2jexVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bamswvsf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EABC4CEF5;
	Wed, 17 Dec 2025 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765959313;
	bh=2OafIiysh5+/QTm0bhByzlnf9H06b6KUh52r+eioDGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bamswvsfdqnM6YpVQVosEwPZ325jREx8HXJ8dr3eW+sDlEpX9BoirDR27o5lXgMBh
	 ECu00Tdl1L1RyZ9IDyzDjxC8fHeM/pHnnvDgJeEBEGDAHLEmivyWyILu5g4zVzLvD+
	 kfGY7loxA1I5tpRCRYavBLWACvVBrqR0yxKqOnhmRulv1KRtcwSi5qQvWn41uZ/QYA
	 kbouGPqGpUJeed8MQUHUu0Y7ckXuvo26fg1FMxdKqW5UcoBLGCcRmgZCrO0btlZ/nr
	 fVZ5qSB5Oo/VHkWtBRRlZqfiD9uRun5okB9YaM6hrqVft7cTWz9b5esDstYjqvneJ4
	 R2KCQvYpHRTng==
Date: Wed, 17 Dec 2025 09:15:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	kamal.wadhwa@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Message-ID: <20251217-quiet-wandering-gaur-c9c6fe@quoll>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
 <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>

On Mon, Dec 15, 2025 at 04:41:04PM +0530, Jishnu Prakash wrote:
> Add support for PMH0101 PWM modules which are compatible with the PM8350c
> PWM modules.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>  1 file changed, 1 insertion(+)

So how many nvmem entries it has? You need to define it in schema.

Best regards,
Krzysztof


