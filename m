Return-Path: <linux-leds+bounces-3965-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F89A33CE6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 11:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F07561889134
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 10:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E2F212D95;
	Thu, 13 Feb 2025 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LODl8hsH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BD211A06;
	Thu, 13 Feb 2025 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739443284; cv=none; b=P9w1eTsd6kab4GdxZ/EM14T1SVs5ZC6M4hCRm4LviDCxayTlQMCAxLZ/6jGZLz7fyjbTRSVS4iZ8cqk1DGhuP/hsGYCTNjvBwHsZ6b/+aa0i1UsQV984PDVj2DgVQO9O5SMpXY/hC6bu4YoiliIIKfc7dUyes1euEPzqk+W1SUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739443284; c=relaxed/simple;
	bh=yS3ZXBifaM1osj7cDQyKiVO9YBjcdqedSQMnF4RFzqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkdWhfo0+kyKQVLgqXrMbMcxLwA5Nh/Oa66Wl0YLcloJhhlve5hI4f64+WcA3zYg4/lhwW5BvW248ux/e6eBvS3z/eCIlQtfC6PgXlfR3rg9RDAhZjUmZyJ1F1slCUfnuyxFblbd4LpXauic+HFoX2uKQ66gNB3qtzQ7JmjGc4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LODl8hsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698D5C4CED1;
	Thu, 13 Feb 2025 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739443283;
	bh=yS3ZXBifaM1osj7cDQyKiVO9YBjcdqedSQMnF4RFzqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LODl8hsHg4ykOVptYtrDbPuOQT1Pj25bdgDbdwcqdnxnlkgzZvOm3dTtXMvMj1lZJ
	 0fbRRASMBP8Z+Je24schchp+9+VWmheXb9pATbCWFT0HaCR+tYnWIN981cbWRGpNRx
	 NiSn932QjDaF3QakMZ0n1fqQuVbEURn4MdrkQZQkvsHtkdfe82v3Rl9stSkvfI++Am
	 XC8+Y62UbY9r/YgzVSWkunAcRR6Sc89A9vDDz1f67h04pCSqGzSBsIlM7wx45+Jg4l
	 xkW0V4KmTXHdH1Q0e3l7YQ6hZSRqras2fBLhnSIr+Dh0vxbcD+j9dj7Rm4qmftq/xD
	 yghU972vHSmZA==
Date: Thu, 13 Feb 2025 10:41:19 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] LED1202 / leds-st1202 fixes and improvements
Message-ID: <20250213104119.GD2756671@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Sat, 01 Feb 2025, Manuel Fombuena wrote:

> Collection of patches for the recently added leds-st1202 driver. It is the
> same patchset sent on 2025-01-17. The cover letter wasn't properly threaded
> with the patches that time, so apologies for that.
> 
> Obvious from the individual descriptions, but as a summary:
> 
> - 0001: fix a NULL pointer access error that occurs when LEDs are
> registered but the LED driver is not fully initialized
> - 0002: initialize the LED driver before any DT LED initialization is done
> - 0003: some spacing and typo edits
> - 0004: include the appropriate select in Kconfig to make sure the
> required Pattern trigger driver is available.
> - 0005: remove .rst extension on Documentation/leds/index.rst

Stripping the separators from patch file names and pasting them
culminates in a terrible summary.  In no way does this cover-letter
describe what you're trying to achieve, why you're trying to achieve it
and the consequences for not applying the set.  Nor does it communicate
any merge intentions (which is required due to the assumptions made, as
described in our previous conversation).

-- 
Lee Jones [李琼斯]

