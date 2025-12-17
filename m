Return-Path: <linux-leds+bounces-6447-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5EFCC685E
	for <lists+linux-leds@lfdr.de>; Wed, 17 Dec 2025 09:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 390473038F04
	for <lists+linux-leds@lfdr.de>; Wed, 17 Dec 2025 08:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9033333A9EE;
	Wed, 17 Dec 2025 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT3Bg/jU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FEC33A6FE;
	Wed, 17 Dec 2025 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959337; cv=none; b=FvuWEfj+2fZ9VTztOyztqjVAZDkwHxaRkEgs5rwpsQGYO4VPiXl07rg3AZxb292t2ew/cgKI9aeSgnS9qmqndEifQjemib6DhJm0K3Qn1iuvrxe1fcKn9BikHpKXQ0QRY5v6jKLgXHoaKZyd791ZLuY0yW2AqAdb/aHyXAaJn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959337; c=relaxed/simple;
	bh=v+ZRX8wiodvYiDr82umphgF0kQRDJ+iWIJDjNJLM4nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7EDEu8+KxvgeQJOXnnRdVTD+zOLcNAP9foLKgXrHBRmMuZgmrgYqbTbW6d1/dhPnJ+7LeScwPLq93gs6YW7Rjv+leR6TJB8xvpvo4l0uXG8Y4pxn/irAuNqcnwijUhcqTKDtBIUoQnI8YVneb0cfEOC2VDwH+hssp41RHhsuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT3Bg/jU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7FAC4CEF5;
	Wed, 17 Dec 2025 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765959336;
	bh=v+ZRX8wiodvYiDr82umphgF0kQRDJ+iWIJDjNJLM4nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT3Bg/jUNIy3i7VcJb6iLQarmKjH7/Kjbl1hB93BpHy/TTSlTTekFz0q5xAR8zA4j
	 7yQnD8Ebsq3bCkrcj9eccsIkbbNnmPqMmETmlNKl6ywfrt++GSUBOzs4cNyXouJBHO
	 rB8AvwfBFtG4nKaQ0FijdZ73h8da2zKCTK6nVFzG6bQpSY+9jeuFFh0NgY5O9ylf/i
	 gHx+VNw5b/Pm6HH+71XfKhzuKISa7W/M6u2c6ROg/8Ncm95gEsb+9j99uygnmfRxYN
	 xn/UnjRfxPwlDmpb7ESvRSQ11UBTejoMLWKBB5FLbo5AUg3PqBs2Iy9Za6pTZrP3/o
	 uTWdUXQ5oggXg==
Date: Wed, 17 Dec 2025 09:15:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	kamal.wadhwa@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add
 PMH0101 compatible
Message-ID: <20251217-ancient-lively-pronghorn-7bc3bd@quoll>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
 <20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com>

On Mon, Dec 15, 2025 at 04:41:05PM +0530, Jishnu Prakash wrote:
> Document compatible for PMH0101 Torch and Flash LED controller.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


