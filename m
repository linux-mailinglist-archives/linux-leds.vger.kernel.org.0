Return-Path: <linux-leds+bounces-2253-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B092E18E
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 10:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315852810CF
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACAE14D6FE;
	Thu, 11 Jul 2024 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFmn7LE1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9014B978;
	Thu, 11 Jul 2024 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685287; cv=none; b=Iqg9H4b1NaSIDdaClqDgJagxCHHlMz4ais0/QA5qxEiTQeVQi2Ry5CFrK8p0DUbmfNkAu/dV+wDtQ8Ah0fpy+u9IlpnM4Wa0U8qc4/kDR5lwAeS+lR/0os6DMtr9ftrUk+2rwEZwCE0IbEWwK00TAqrTohhGvm+ExWW2VYYtvcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685287; c=relaxed/simple;
	bh=CpUbhgVmgQbKG8GpwUgFFtl+Zy+nToqNf7pmspAtcVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvO0eFkMbmPQMgn1U9YE/4mC8GR+Lh6IJpCgV95KWJTvOJZDAXPBz4Z0zee2+tQOIPxMPndmL50nGCVbsr3GLE71dGRrD0JCU9n8bsHIrwBH1GWUVkh79tXbvAlL/0j/IKlSeyIvrFlpHsy36L5UkgAeDvBePm42VZtYj6gGyL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFmn7LE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAA4C116B1;
	Thu, 11 Jul 2024 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685286;
	bh=CpUbhgVmgQbKG8GpwUgFFtl+Zy+nToqNf7pmspAtcVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFmn7LE1Y/ef+zhvyeE02VHi+THTgMXxQKZ3FboyWTknVBDTNmbpUxMH3nqnxi/PF
	 oLvlNAqkp212RvHbJToFPNbjC/IRKkPIAnYfeulWY5qJdY9oSXfYd43NmXI9D2tT2c
	 /rI2rds/F1cBjTha/puqnQEDr67918CIdwPovnYCg4H3Q1DtuJyE3qOhOuX8jIqVm0
	 XtmEeX0TqIUNk5t4PwMCUO/SZBC6mxDwEsdm4F6I/XbHLCCXsSkk+f6RMwJL7i6NBm
	 TIJeoSUz06kGJwoDdHMcBP6HuPA4KFCCWkrLdWJSN70nj3eBYOkZaeDK3bNpXa/PfS
	 YWNVu0NbwiaIw==
Date: Thu, 11 Jul 2024 09:08:02 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
Message-ID: <20240711080802.GJ501857@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>
 <20240710165528.GH501857@google.com>
 <668ebf50.050a0220.4aa0d.31b3@mx.google.com>
 <f33d44a1-7100-46f8-8d31-942237e61d90@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f33d44a1-7100-46f8-8d31-942237e61d90@web.de>

On Wed, 10 Jul 2024, Markus Elfring wrote:

> > What is the next step?
> 
> I hope that you would dare to offer a subsequent improved patch version.

That arrangement should only be made between the submitter and the
maintainer.

-- 
Lee Jones [李琼斯]

