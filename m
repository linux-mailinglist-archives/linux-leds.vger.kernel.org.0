Return-Path: <linux-leds+bounces-5533-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECDB86C25
	for <lists+linux-leds@lfdr.de>; Thu, 18 Sep 2025 21:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6C21BC0E88
	for <lists+linux-leds@lfdr.de>; Thu, 18 Sep 2025 19:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EBD2D7DC4;
	Thu, 18 Sep 2025 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzpcHJUw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD317E0;
	Thu, 18 Sep 2025 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758224955; cv=none; b=KDuMwQGId5ACp0GyiCYPrnXYlMUOCZSmo9IM3dhq0hhu1qScW0eEYIztoGG0/GMvNBJ0SoOL563rYGlznwBL1gKvexHn3URxPh/ZZDikVqvEYF58tDB4wCZXFqGwZPori2P/UQsMRxV1Gt2pt7SjJLn+YfqNYv8C/wa7a5UHRXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758224955; c=relaxed/simple;
	bh=DOWTEQuo4rMaJiP285kmFe271Z/e1G82EqKqBXxVvcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqwHKzDkA9cyxPUMAhjWYGnO5G+fT3zzvaI0QzNaKicPKrzrB6IbguiM63C1kMqb6pix+oHWUKReSftjhHswXCyhMaK4syQIbMduiheSE6hgCp4wmfTcspPKTMatSec3c6GQ9paqMKVMEMoBNy/LHnEOCnYAiZvsedA3lB29AFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzpcHJUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92605C4CEE7;
	Thu, 18 Sep 2025 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224954;
	bh=DOWTEQuo4rMaJiP285kmFe271Z/e1G82EqKqBXxVvcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzpcHJUw8JgsHpXYrBT5heRvES5xZw+lpBKm6/76GkDcI4xI6Ku0jQtF+49/lQ/u+
	 iKx7MuBor1ns4OyKjbIYXVZVsC/QvbwrtKOWUWuGQvhRPAEYVs0c9tgNt/PFAS2p6f
	 Dn/1RWIv7IVeRViyotIttD0WuzYMPPUTNsJZOvq782OC1xA5FKxlIYmF6DoiF7Zt21
	 KbLtygidNft2ogdagLQmvYDIQPFdO2NFW2DymbjjPONIHKGQmpYFv+3CeufP6gNs5N
	 I5VoukcThF6NFSDdSZupX8l7bv/S5PiFw4bTWoMTCr3kgiUIo9I03AvQXZTeS0pgoH
	 0gVwnTiDeMVyA==
Date: Thu, 18 Sep 2025 14:49:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: leds: as3645: Convert to DT schema
Message-ID: <175822495296.2513894.14677685626587250607.robh@kernel.org>
References: <20250916-ams-txt-to-dt-schema-v2-1-6a9db6fb7ea3@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-ams-txt-to-dt-schema-v2-1-6a9db6fb7ea3@thegoodpenguin.co.uk>


On Tue, 16 Sep 2025 16:11:01 +0100, Harrison Carter wrote:
> Convert the ams,as3645a.txt to DT Schema format.
> 
> Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
> ---
> Changes in v2:
> - removed unnecessary descriptions
> - cleaned up clear text
> - fixed syntax
> - fixed line length
> - Link to v1: https://lore.kernel.org/r/20250909-ams-txt-to-dt-schema-v1-1-8a30c25c8295@thegoodpenguin.co.uk
> ---
> maintainer: set to what I found in MAINTAINERS
> ---
>  .../devicetree/bindings/leds/ams,as3645a.txt       |  85 --------------
>  .../devicetree/bindings/leds/ams,as3645a.yaml      | 130 +++++++++++++++++++++
>  2 files changed, 130 insertions(+), 85 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


