Return-Path: <linux-leds+bounces-4321-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB5A68748
	for <lists+linux-leds@lfdr.de>; Wed, 19 Mar 2025 09:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB27420EB0
	for <lists+linux-leds@lfdr.de>; Wed, 19 Mar 2025 08:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234562512F5;
	Wed, 19 Mar 2025 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjhuiEgV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3BB1BD9C1;
	Wed, 19 Mar 2025 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742374358; cv=none; b=mJO8qq+xNiTukKM3Px/QX9KKg1+ewGRSfn4CHzfwEMEHoWafjsP0KtiqT4VOPjsRleK2qN4pyeL9PXfR6nElFYc6sWF0Ycel+LVnHby4yGvauWsQIRAdbac7OKaZIUwBbAm0TCEpyndRtyPRDP3SONRCQeHrS1R+0/VAZpOVGWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742374358; c=relaxed/simple;
	bh=o3oGNj0pXLsUiYelk/38Km0NuVDExYGJsbYq0GRix94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx7sDcmYtTlaOxOFrygMuV5OfdVFbHSfy1Y8F9Efs2KjYu/cSQ84GLKs80kWKDbA8AspHbBS/QfCOrmNoyFsQp1F71YBgirP0vbVTr4Tu7lxJpMM/F0AUs/EDSLHA0Sha6mrKU7oXo/jwbTq6QdP3WO8zR/Y35U12CVCB9nsKGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjhuiEgV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE45C4CEE9;
	Wed, 19 Mar 2025 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742374357;
	bh=o3oGNj0pXLsUiYelk/38Km0NuVDExYGJsbYq0GRix94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjhuiEgVCOPYTRlBz1UsGEr15FgOP5qggMqeRqT6JHeZR+OxGBogSV9MtrvQ3+WrK
	 CVzZErGIr6tzDNxmaiOSrHT8X0yWLpT2NQqEu3ycGa1v1sSvyCg9Y55PRotMuNy3+o
	 fsKpKKqmyhh7qXR3T7FeeuHlqWNftv7yXSV+azZId7q2krS0ae04eQPJLEel+zemId
	 CkmAyX+fv2Uf/U5G88bsOlzJPK249XZI0mt8zsk9Pi/pYJLmVeuKolb5jTXhP37MlW
	 n1x+LrMpSopBZTnycIZI83hgCb3LJoi+1BMOL7qzaWufTjF0Adiq77aUXwSlAqrWKB
	 qdlTLKOqB9+pA==
Date: Wed, 19 Mar 2025 09:52:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add Texas Instruments TPS6131x
 flash LED driver
Message-ID: <20250319-teal-zebu-of-defense-aa8fd8@krzk-bin>
References: <20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at>
 <20250318-leds-tps6131x-v2-1-bc09c7a50b2e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318-leds-tps6131x-v2-1-bc09c7a50b2e@emfend.at>

On Tue, Mar 18, 2025 at 08:28:57AM +0100, Matthias Fend wrote:
> Document Texas Instruments TPS61310/TPS61311 flash LED driver devicetree
> bindings.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../devicetree/bindings/leds/ti,tps61310.yaml      | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


