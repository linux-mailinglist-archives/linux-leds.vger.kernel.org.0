Return-Path: <linux-leds+bounces-4028-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31EA3DDB3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0410019C0591
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC73B1FBCB6;
	Thu, 20 Feb 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kulN/gCs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCBF1CA84;
	Thu, 20 Feb 2025 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063810; cv=none; b=biMGRqsRQPCMTGD/4cwFZZrAqAVUi5gQZkVkELJfcRPx/B9R+xTu6m0fpIovB7mSE4alrrGyZGFlw/2G6BV2bekY+ABTK0UbeXv2bP9S3/ja+E5cRCWZDArGdNlpnSa2Q0/NyTh7rLV7XskwXSxjIwMViDbmky+3ZPPRA02ziu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063810; c=relaxed/simple;
	bh=MXppZVgS57LyPkie3W4jmuwlmfX7xCTlj0CpJckGO9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWk89Eylb8CGOvkGY3AV29iMINIzshXJKqmNMY2huIV7rxE8pRfKCyWq/jyO9LiXlhCKUGdF48ZQ8HL3tRsKUjmK15Ti7VEB8zIbDTm9QptsjWNU2s4pTesQzKZZ5SX+d1BUHYDvblepNTA7iswtDi1ihQkjbc0/CUzFc1eceSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kulN/gCs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7CCC4CED1;
	Thu, 20 Feb 2025 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740063809;
	bh=MXppZVgS57LyPkie3W4jmuwlmfX7xCTlj0CpJckGO9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kulN/gCsg5OYZAoHwdr4ADAXXkNUB1BDL5AS1Bj9+DWmSfE79BbOpRseTIMOaFg4B
	 AZ8y6X2HXYXwxS4qhP9UbzZnyvCr+7aYbofQvck4Dd225ffRyJT2d6C0Ec8kzsL7hg
	 sL2Uu7dnX2gUwZrMAWCRtdswpBoCJQUsrPqo5UAFQpE+4+1hlRly+5hPGogbr969Nk
	 dZUyiAbg6OXsvNsUic2bQY7nv/etYOx9Lf8DriprSvDjE8vpfpsHjFhhqLYs4hNitS
	 OnHL1T7SnyCQjRVymrZ8dZSP/Gzmhnlq965RstJ5i3CBpiQydkARb+XhW+PfDgFA9S
	 Z/BDfpxhHKDCg==
Date: Thu, 20 Feb 2025 15:03:25 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] LED1202 / leds-st1202 fixes and improvements
Message-ID: <20250220150325.GE778229@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250213104119.GD2756671@google.com>
 <CWLP123MB5473AD120D1AA064D44B10C7C5FF2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB5473AD120D1AA064D44B10C7C5FF2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Thu, 13 Feb 2025, Manuel Fombuena wrote:

> On Thu, 13 Feb 2025, Lee Jones wrote:
> 
> > Stripping the separators from patch file names and pasting them
> > culminates in a terrible summary.  In no way does this cover-letter
> > describe what you're trying to achieve, why you're trying to achieve it
> > and the consequences for not applying the set.  Nor does it communicate
> > any merge intentions (which is required due to the assumptions made, as
> > described in our previous conversation).
> 
> Do the messages in the diff section of the patches need similar 
> improvements?

You can use the patch-level diff sections to add per-patch changelogs.

-- 
Lee Jones [李琼斯]

