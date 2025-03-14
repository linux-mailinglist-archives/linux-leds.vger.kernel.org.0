Return-Path: <linux-leds+bounces-4273-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A6A60FA0
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD7817D0D8
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904E11A5B82;
	Fri, 14 Mar 2025 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsOsPsgs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E521FAC59
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950604; cv=none; b=I80QAV1DSOtcoIUGSI7Mdc1HbyEwFDHbYvyqZcI3LoXphXswo+wLnE0NQu9pKqV9KRDx0LXZGUSy0ye3xKkDUOAyKYxPkxMNSbyi42Ft90V0X4Ltq3P/SgysT0tvhM6xi6r3eOD2uHDIqGhQxmYTqp7djZ9a5HZI+IDmTUT1Yp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950604; c=relaxed/simple;
	bh=qdxkvKrzGZRqnibt1mT1IZqM9Wg3j87qhs84ywFiGtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZC06TRNVzY4F48mho2nBuVtKJJtq5bpTzlGlTM21aVdh7en6Ol88Yx8GuDw9T5GuWYzpnY/yFYk0q0NL5FSudFA5PznW76u9d9zYhSErPXdBvI+Wga3nvAqnpjD+XqWESY3RvglZkVRTyNwGQIshAoz+Yhy6haxcZcI8bTuL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsOsPsgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40403C4CEE3;
	Fri, 14 Mar 2025 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741950603;
	bh=qdxkvKrzGZRqnibt1mT1IZqM9Wg3j87qhs84ywFiGtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsOsPsgsGMswP81O4H/wVGlJYqxNJIYH0EVNMASMv1YPICs0If57/fy9DMNBbwIFN
	 t8nB0BcsYPiBPLavXYwA4fd5xXaSX0KyqCQCGE3z8LwthpDRRvHTcapXfGh4E51N3s
	 Iv+0lnttW3ejT4S7IdLa1Fi6qPQVG15Dy9Rs0zhA8XNhCxF0QeY4s20Jozv8cpUx+9
	 KZNCCGETVMVFWepAd7BQhI9/RSV5XFtPo/3PXX9ytBCMgOybsUjIpt1trFgPKBbK/Z
	 Lltz8ZH9F4pUJqcfL5uKEqoXvGj7cPcZVgSEdoBiN/UomvuyhARhR7LShnDFHOWn12
	 FMw5gqKlRt3fQ==
Date: Fri, 14 Mar 2025 11:10:00 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: uleds documentation fixes
Message-ID: <20250314111000.GH3890718@google.com>
References: <20250311042642.373782-1-craig@mcqueen.au>
 <20250314110853.GF3890718@google.com>
 <20250314110928.GG3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314110928.GG3890718@google.com>

On Fri, 14 Mar 2025, Lee Jones wrote:

> On Fri, 14 Mar 2025, Lee Jones wrote:
> 
> > On Tue, 11 Mar 2025, Craig McQueen wrote:
> > 
> > > * Add max_brightness field to struct for setup.
> > > * Reads are a signed int value, not a single unsigned byte value.
> > 
> > SoB
> > 
> > You must remember to use `-s` when committing patches.
> 
> And run checkpatch.pl and Cc: LKML.

And get_maintainer.pl

Etc!  =:-)

-- 
Lee Jones [李琼斯]

