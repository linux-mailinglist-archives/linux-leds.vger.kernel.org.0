Return-Path: <linux-leds+bounces-1161-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A862D874263
	for <lists+linux-leds@lfdr.de>; Wed,  6 Mar 2024 23:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC347B23167
	for <lists+linux-leds@lfdr.de>; Wed,  6 Mar 2024 22:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B931B941;
	Wed,  6 Mar 2024 22:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPUVzL6W"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D631BC22;
	Wed,  6 Mar 2024 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709762785; cv=none; b=BAfMoaRp4Uk/aqlPzgPLjv9QfAmouLM9iNAmcLhcmAKMpQXZNrlqWUjxL00TTcbnBNRONUzedMdbj6rt97AM59olM4GVhFI5BZhCTAdVpKQgphRjb0tlyZT3JkU5JpZCOTtT7eb8zDICyVzVh1xef7Vr1ZzARwlj6lNL1yLeBIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709762785; c=relaxed/simple;
	bh=n6HHDuFVnHzuhMnSsH+SBsi4lxo63K+jG/3laYwIoWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gedhI+mYi3C15NUeHcZDzD8CHtnF55IWPXnEGmDLMSk7mtWcmX6mUfBkIF+Q6jlP9Xl5QxOJVWB+41eqDIQeotngSa3uPqSHmfIEG/vP+kg5IbmFXuh4kqgNv1Xe0o6ZCg2DZzbgU4D0rAc97/LtgoKWw67XQfPVoxrBhrDw4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPUVzL6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE16C433C7;
	Wed,  6 Mar 2024 22:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709762784;
	bh=n6HHDuFVnHzuhMnSsH+SBsi4lxo63K+jG/3laYwIoWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPUVzL6W33OtUm70EYpMiO29J9dwBH+D8dYMxcVrXsgBhoIf4NfZBY95wqG/53z99
	 N32Ayb0uvRu442s5DMTAh/pJreYiyR6VzOVHXB8oOrNDszRQJkNesY8YMghu23rnN0
	 mlFLxQmVooPX6LcMKbpswX8CePMs+cxSO0H68o8WfhAEnfrHqAI5Li8ta5iE8rGWMq
	 hxxfQ/B2HyFhUMuFqMQyIRT65gupOJH3Rt9vv7SLnwB03j4uLkkWVTX2kjTyEmDic3
	 Xr2lrzql66vEaoe/+66x8lKwdfncyaGyCZUaI5tpjBmQ3Isj0qWvFyJful8uOhtqp5
	 WN+6NLKRlfxDw==
Date: Wed, 6 Mar 2024 16:06:21 -0600
From: Rob Herring <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: pavel@ucw.cz, devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
	linux-arm-msm@vger.kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: qcom-lpg: Document PM6150L
 compatible
Message-ID: <170976278118.750398.5338079498670448079.robh@kernel.org>
References: <20240306172710.59780-1-danila@jiaxyga.com>
 <20240306172710.59780-2-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306172710.59780-2-danila@jiaxyga.com>


On Wed, 06 Mar 2024 20:27:09 +0300, Danila Tikhonov wrote:
> The PM6150L LPG modules are compatible with the PM8150L LPG modules,
> document the PM6150L LPG compatible as fallback for the PM8150L LPG.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


