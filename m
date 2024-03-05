Return-Path: <linux-leds+bounces-1141-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2E8721FE
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 15:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C871C20B09
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 14:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451F885928;
	Tue,  5 Mar 2024 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdV9JVb5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E116127;
	Tue,  5 Mar 2024 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650374; cv=none; b=cZWe0tBrC2XKNh3L0H3m/uffQgYA33qjqt6Y95D5US6t2KFPJ1p3Yf3Yz6v8ajxOYB/FoywhvTEJvqObX/jnZuWM+kMCHB8lZhQu/+DS187uEdBXXPO+JFx+2KaenXViUtea9cX0okN7kc6z30cxzi0B2txLUs571cUCooVMtBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650374; c=relaxed/simple;
	bh=nBqnTHfOl1CIZ0Th9P7dzJT1Db+T9rYlxuWK4sXXDec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLIvQN1rhMThui0utLMPRpWTtphbRJ+GxJoCc4mEpdeev6UTIF2f+rTg+oBTmAxkd9Rr2V7XdHkMpZEe1IPV0i/udQaQqhxcwpzybCk/1/axXmkcOc3HQPQf7dTavAONrJQmDTmp1dNc13endljNnxKhsD0ojq2CCrnITgBuYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdV9JVb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FED2C433F1;
	Tue,  5 Mar 2024 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650373;
	bh=nBqnTHfOl1CIZ0Th9P7dzJT1Db+T9rYlxuWK4sXXDec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdV9JVb5LDuJ/1PeYUCh1neM/UlOJKteVQ1O75nz94rIkmcW7mAFot6JneOF4gK4t
	 gX+kw1/SSW8X/sRDfUQObVMzEL0fH+QY2fJoLKkM7QA0wymlGu+7x8/dV9Swc+itFq
	 jqOuylW6M0QJZoEoFch1F8tcRlWX6N8s1KZu1GRidvM4PQelRg4BkE2+Cd/PpjS+w2
	 DbrMOxIYOZ57I+QAJERZCpFIvd6hqFtTEtk8NEw9AAU8HcNhrmNQlTb6P4LKEGaya9
	 B59Tmnm+CxPshjTpJAaKaJ6c0qAKXm2pdgAnRGKTjZidAn0+NCw/ML9izNhtMb/hkZ
	 e/tUgwid1Lrhg==
Date: Tue, 5 Mar 2024 08:52:51 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Matt Ranostay <mranostay@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	devicetree@vger.kernel.org, Peter Meerwald <pmeerw@pmeerw.net>,
	linux-leds@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH] dt-bindings: leds: pca963x: Convert text bindings to YAML
Message-ID: <170965037070.3336464.11666013116412320889.robh@kernel.org>
References: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>


On Tue, 05 Mar 2024 02:45:01 +0200, Laurent Pinchart wrote:
> Convert the pca963x DT bindings to YAML schema. The existing properties
> are kept without modification, but the example is adapted to the latest
> common bindings for LEDs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> If someone wants to volunteer as a maintainer, by all means, please
> replace me :-)
> ---
>  .../devicetree/bindings/leds/nxp,pca963x.yaml | 140 ++++++++++++++++++
>  .../devicetree/bindings/leds/pca963x.txt      |  52 -------
>  2 files changed, 140 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/pca963x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>


