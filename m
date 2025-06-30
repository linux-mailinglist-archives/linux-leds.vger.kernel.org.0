Return-Path: <linux-leds+bounces-4947-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 485ACAEEA19
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 00:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78204421C72
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 22:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE2A242D6D;
	Mon, 30 Jun 2025 22:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFf7s09i"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140E1DED52;
	Mon, 30 Jun 2025 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322081; cv=none; b=TmqB+/l6JPS4nzJE59p9TA50DPIdU44d7cuiOK8vyfrYmivgjE9s1wFTJ3/uAEAgKdq2zvkKhvprH4dzuwkRIafobwTwWEy8kAGTXUBKU2w7NVK9o4dkGiGqRmSjlCRsr/JVPsiGmyA8j2DRFXRNL611MHAx92+b9qMFenDwP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322081; c=relaxed/simple;
	bh=JHLt+E1KeWXx/Gt9usgyy3veEGfVkYPzqGFc9ljsgfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5PgNxK+bSY29J7m4BvCS2rhRXGh2hnZyh9MENxpBd9bqNk6KuM0AQy1O4hpill244t+GJ8X+eaWP7kYjlC73+aF0tC6uIonxQPY1i+sX2atamjO51JDTpiMPhmO9ETG1i2C5Os61jmTzk8dWTNQPW2QJND7EwAWAWkrUWr7d/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFf7s09i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E69C4CEE3;
	Mon, 30 Jun 2025 22:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751322080;
	bh=JHLt+E1KeWXx/Gt9usgyy3veEGfVkYPzqGFc9ljsgfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFf7s09ieUy3OZm0O29erTxiDFXTwuboV4OtF0EDQZTsXZUBu1SK5kse6Cd4jXrtf
	 z8DlHSUyWC7N5DpR+6Z7h3VwdLKpFoD2Ugwe+ef/qn0luN/9Zp5ytIoOAS2Czq9G2l
	 qVxvPa7doPX8cAZZLyzsnDYf10KSQb7Xv2kN6GbKhUHce67VbaNdYDXxiAFtXW3VyD
	 avL5WSQDhWNKs2l2VF2eDSTwzW93Ylv0LOsIkC6w/02igMiYzeTmSsrr9mavZgvETc
	 8RZNd2iVjE40Lwhm4I6yF86ydepbojvDMQzwylHmpml7cs4xLZSsdenbmXWIpZxay2
	 ChXLKilahim9w==
Date: Mon, 30 Jun 2025 17:21:19 -0500
From: Rob Herring <robh@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	devicetree@vger.kernel.org,
	Lucca Fachinetti <luccafachinetti@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20250630222119.GA3578069-robh@kernel.org>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
 <20250627-leds-is31fl3236a-v2-2-f6ef7495ce65@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-leds-is31fl3236a-v2-2-f6ef7495ce65@thegoodpenguin.co.uk>

On Fri, Jun 27, 2025 at 11:20:36AM +0100, Pawel Zalewski wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
> 
> Keep the old maintainers field as is.
> Add datasheets for reference, NB that I was not able to find an
> up-to-date, funtional direct URL for si-en products datasheet
> so they were skipped.
> 
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-is31fl3236.yaml  | 101 +++++++++++++++++++++

Also, not quite the compatible for filename: issi,is31fl3236.yaml

>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 -----------
>  2 files changed, 101 insertions(+), 52 deletions(-)

