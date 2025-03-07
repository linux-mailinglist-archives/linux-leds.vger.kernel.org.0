Return-Path: <linux-leds+bounces-4194-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A5A56C13
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 16:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3E6F1892DF8
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5C2217F31;
	Fri,  7 Mar 2025 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMxNqGoz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FD2E822;
	Fri,  7 Mar 2025 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741361419; cv=none; b=iw3nnYL2D518OvbPTwRLeBKHIoSz9w+d72F9yFmu0/eQrz8dC18FhNV7K6maglctGU0/naldTDWtIFBoGj7FcBxR4uOhOTSYxg7NaoMJTjvWXVSq8TUWfOpd0kcg0imbahmmxCzccGzXF4p/AI+K5qs3nm5K3yXKEPp/1lxJZe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741361419; c=relaxed/simple;
	bh=JKUAorR660sT3IWHe3etIrBMH0PN7xyHuOUw8tYsmM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtlfG5/xY6MlGsCpRaKDfOg+jdJPg+8ljVMgrtJKcrLWf8ZhRLaHlKX0+C+FepPW88URoJgmqWuRIpo2z1GkGvoktfIzLGm4Tl7g5OeWihm+krHoQdYmEQ9hOkmcj26OaCy8nrHUkH6kSI1b0wRdOHGfkFhNBXuu1Ji2fxU7WQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMxNqGoz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EB5C4CED1;
	Fri,  7 Mar 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361418;
	bh=JKUAorR660sT3IWHe3etIrBMH0PN7xyHuOUw8tYsmM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMxNqGoz4YgNr/oy+aYg8C54b/XOJozop9Gla5EdBk9z8eE3xnfj8ati3mxkw/XGO
	 SUKAh/trdc13Vl0m6KW3+ZazGQeNvQWPibvaG2Oe+Bl3PMaUvhtvK/sx3mG4hYE5Bk
	 iWiDM6jjF7AwXA++RrU/liG/ZsSuHx27OZ+ixq2utrHakfE5foBDvTMdwB1YYogD21
	 OXj6aIc3UhF7zlMjodTSYA7Lb4GDH2cHLuwidHtUEWbftZOwOfLhhnD43Z02T2QNv8
	 voF4qTuHEX31VaqoCCcEJsM1eRnLlwUJgOOKvqG8I41Jhr1IPwH5y3m3869hoRVpSO
	 5+t7Ir2SQ8x5w==
Date: Fri, 7 Mar 2025 07:30:15 -0800
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: Kconfig: leds-st1202: add select for required
 LEDS_TRIGGER_PATTERN
Message-ID: <20250307153015.GF8350@google.com>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB5473F4DF3A668F7DD057A280C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <20250306234727.GD8350@google.com>
 <CWLP123MB5473AFE2456779BF93951439C5D52@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB5473AFE2456779BF93951439C5D52@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Fri, 07 Mar 2025, Manuel Fombuena wrote:

> On Thu, 6 Mar 2025, Lee Jones wrote:
> 
> > On Wed, 26 Feb 2025, Manuel Fombuena wrote:
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -971,6 +971,7 @@ config LEDS_ST1202
> > >  	depends on I2C
> > >  	depends on OF
> > >  	select LEDS_TRIGGERS
> > > +	select LEDS_TRIGGER_PATTERN
> > 
> > Don't you need both?
> 
> Not sure I understand the question, sorry. The patch adds 'select 
> LEDS_TRIGGER_PATTERN' to the existing 'select LEDS_TRIGGERS'. So yes, you 
> need both.
> 
> If the question were meant to be 'Do you need both?' the answer would have 
> also been yes. Having only 'select LEDS_TRIGGER_PATTERN' doesn't select 
> LEDS_TRIGGERS, and it would be even worse because you wouldn't have any of 
> them. I tried that first, in case select LEDS_TRIGGER_PATTERN implicitly 
> selects LEDS_TRIGGER, but it doesn't work like that.

Never mind.  I misread the diff.

-- 
Lee Jones [李琼斯]

