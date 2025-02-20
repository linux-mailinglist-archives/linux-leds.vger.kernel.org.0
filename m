Return-Path: <linux-leds+bounces-4027-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEBFA3DDA4
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDAF917DC5D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF651D63F6;
	Thu, 20 Feb 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2v74DSA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C85258;
	Thu, 20 Feb 2025 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063688; cv=none; b=QEpK7R3KJx/qtjQji6UBEoYnQBfvQMK7lnVtB00MwJ01TaFmRLp/TuYZifnwUGV/8nw24rDUyYCNeN36CtzFNNFnk80vEek12bZPI9QI1Ju4hC4jb822U4dBNjaja3D59bxYtnnuO1QhZpyL/xcpN/OxbSHOYiThfZK50/Q6aZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063688; c=relaxed/simple;
	bh=94ImA64uIlnzboeoRY4vrSCi/VzI+cwRL+UuXNa/SLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiywS2Zad0PGrz61Vb2/RVjqlryGAKpMkXQdanlOYphy3ezsMwrLMJxKh9jwYVYhzuBQRfDR+10NBRg9YxZQ9Wu5hREIS0yAmgtYFGf0zeAQqLAAghuiQfkYHNCDeG/6viIKSi1QyWDlWa3GTKShyR0XVv0FFhOaA6RCNQOCIr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2v74DSA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B14C4CEDD;
	Thu, 20 Feb 2025 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740063687;
	bh=94ImA64uIlnzboeoRY4vrSCi/VzI+cwRL+UuXNa/SLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2v74DSAVPKxwZWVivMnCo5KSnhBdn4f1U+zitFnUIUD9P0+EZo8oy/wGwXXUn7lm
	 cWHjhgl8GYp31A0AHErNqFCjrdS3Sl7Ybxfaq/qNS4Srp2Vh2MaeoMcB8WgN80z7n0
	 GQ+k6Wr3N2lnNB6LvYTNyMUujLvTLJMWg8mUx/nmNZcHg4HnYZ/k52oM53umDu1cNV
	 FgoiGzFPd91yzoOAWtpKDyWhhIls+ce5JcEAFDVgpEbaOHGkEvXNS3AzCXKDnGosf6
	 hX7Swfy+QTJ2JvcakC3DL17XDxNSCtKhZcaLlV9FJX+gUO1IFPvjhVS1VMVfXO5K46
	 1SD3Tg/pdbDuA==
Date: Thu, 20 Feb 2025 15:01:23 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] leds: leds-st1202: fix NULL pointer access on
 race condition
Message-ID: <20250220150123.GD778229@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB547377D20905AF224E682BFBC5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250211133149.GN1868108@google.com>
 <CWLP123MB547308A731A2B7F1B7FF12DFC5FC2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250213102449.GC2756671@google.com>
 <CWLP123MB54739D3E587725A0E408E2E3C5FF2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB54739D3E587725A0E408E2E3C5FF2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Thu, 13 Feb 2025, Manuel Fombuena wrote:

> On Thu, 13 Feb 2025, Lee Jones wrote:
> 
> > Then you need to separate the set into patches you expect to be
> > submitted to the -rcs and ones which can be applied during the next
> > cycle, then go to lengths to explain that either in the diff section of
> > each patch (preferred) or in the cover-letter.
> 
> One question so I don't take more of your time later on on this. Should I 
> continue the set with 5 patches as v2, applying the above and the other 
> comments, or would it be preferable to send this patch with its 
> cover letter separately and drop it from this set?

This and any other patches due for the -rcs need splitting out.

Please submit them all again.

-- 
Lee Jones [李琼斯]

