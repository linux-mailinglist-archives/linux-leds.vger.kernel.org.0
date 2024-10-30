Return-Path: <linux-leds+bounces-3214-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E60809B6FBF
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2024 23:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88276B20B17
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2024 22:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B711946A0;
	Wed, 30 Oct 2024 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UXK4CUjq"
X-Original-To: linux-leds@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8331BD9E7;
	Wed, 30 Oct 2024 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326522; cv=none; b=QyBfsbvCpV8VFWPSkQaTOAJg20CH2X8o5uxJu8iQCGAomQPbIIKu3ajcVsElcGy8xlHfXHI+Ea2HcY4Uydcga1z3WqTjY+qMchM4asU4Qa2XBKUM0w+o0RWoUFMkIWZjqkVDXvfj47HHFVKQSw7AY41NOIgmIZid6nkZzaGNvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326522; c=relaxed/simple;
	bh=gNLiUSNDbUK5gdJ/h7yIJYBjBIwe3NNxlxfk6xel3pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YzPCblr7f7YWH/30fvS8RcaZDgoPYj8DO3JXdV1nAvkPrDzMtLPU+t/qXD/+35O2e3GtDLGIVUtpAVv4NxiNrHrLcyK06chJe1WcbO1Fw/r0a6DMxEQ4+RQ7waXrvUxht4H1miwb3sYaxlUg4YT6f6/1XFXvom/QHlCItNLemrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UXK4CUjq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=gJT4TIuL5C3aM++J2WsarLR+2jY4J6dluuFUhKk9z4A=; b=UXK4CUjq4BGkQvoO5JD350HT52
	pn9mHPx+tyLD8CO3pdGKU7kiJdhPoA2Lo6LuASPY239RIMYM2iGpdV3k/YheEKeXtviRI5MMWwZj+
	scQJYCGbNApG+YBRkvy19ARf7MM77Th523lyoyd5awfqBGv/PPLOv+CMReJeS7Qx7CbIsRBTUJZbj
	BgWPs8is8dVCzNOOgxzMtwo6FU+10YJFSAe3NNe4vLXzSG4CSS1F2NSRpl3vtpL+tNKSgnhSun5B2
	ZiJZ+AIhf6xZAx9OJJQtUqkci2GOx+rTU8LvmYeWmhLZEIcxVyRSpmMUYSeiTBqx/3p2rId1XbOEW
	fGb+ZxRw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Gy9-0000000DyJX-0Pov;
	Wed, 30 Oct 2024 22:15:14 +0000
Message-ID: <ede71e83-8f3b-4d66-b3dd-bcf3aa857b99@infradead.org>
Date: Wed, 30 Oct 2024 15:15:01 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] Documentation:leds: Add leds-st1202.rst
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Zx0BKtXo55D_pCGk@admins-Air>
 <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>
 <ZyKulcUCW3kk1AYX@admins-Air>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZyKulcUCW3kk1AYX@admins-Air>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,


On 10/30/24 3:09 PM, Vicentiu Galanopulo wrote:
> Hi Randy,
> Thanks for the review. Addressed all comments.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Changes in v2: Implement review comments
> 
>  Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/leds/leds-st1202.rst
> 
> diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
> new file mode 100644
> index 000000000000..72286a512c69
> --- /dev/null
> +++ b/Documentation/leds/leds-st1202.rst

-- 
~Randy

