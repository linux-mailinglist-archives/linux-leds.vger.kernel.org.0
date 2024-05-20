Return-Path: <linux-leds+bounces-1691-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E71348CA38A
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 22:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877B31F21ACA
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 20:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BEE137C26;
	Mon, 20 May 2024 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b30VifEg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289C168BD;
	Mon, 20 May 2024 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716238711; cv=none; b=PmNbZMH2fq6LGraj7JhYF1XRffQcnqZuFokCn6gomuvY6Kp2lH0fKosHfXgspwn19cHpm3vBfrMqXfV/lQTx5EUW8TaXVaBVRMJQCgV5aly1lYMnmRJpMkh+hbgJl8SOXBHjUdl8KitgidWB1EElx8OPv+L6SCbTeykWC2sDTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716238711; c=relaxed/simple;
	bh=eYd2KXqz8KISlsmwcmkEwaTMKL6gOnhgCdHA+mduSAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqMeSNmEnrvk/mpl0/VF+ul63PhjMreqqrvGkc+v3ytpsOwvgqgU8q28e9am5/OFx4DCuxMaaH/aEQj3q8wYuyCWqSXO1FtZfMVVq5xEFSta6DyvrLNfL/wxKi15yJIMbyGf0Sy1XuCUV/hPGXjjUqblhcOZpf+FA+d4AR+aVP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b30VifEg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96DEC2BD10;
	Mon, 20 May 2024 20:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716238711;
	bh=eYd2KXqz8KISlsmwcmkEwaTMKL6gOnhgCdHA+mduSAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b30VifEgYCh9qcJKyMykxTK6l65+0z/PCFNuCciIQ87kjuwPbZw2QhK4sebqK3qo7
	 hRPRVQWQcqprfqEvgoNjCBKass5OSlTCjStBG/R41ml0j1a3l3ZqR7q+BrnZvk3D7s
	 3YSWQoW2JTAMOhRGqGcO8PRqm2jQBxPpFKuwHnKh5cDmOxhR3cDw1dfm1OE97xojGu
	 8NF8GztVML9xT1oKPcJi6NIDlotMjHm/iM+pjKuTa8xzgbyT5BrWXNEXEjuaWi555O
	 8qhptiQa0P7Z9KSi4rbAWKyGtutfjm7cG7vydHs9jeEVEsYnW/LaxyBwzvZ23bTUrL
	 uatnBdcF75d5A==
Date: Mon, 20 May 2024 15:58:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds-lp55xx: limit pwr-sel property
 to ti,lp8501
Message-ID: <171623870733.1463818.1616231535917945438.robh@kernel.org>
References: <20240518125914.2938-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518125914.2938-1-ansuelsmth@gmail.com>


On Sat, 18 May 2024 14:59:11 +0200, Christian Marangi wrote:
> pwr-sel property is specific to ti,lp8501, make it conditional of the
> related compatible.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


