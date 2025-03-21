Return-Path: <linux-leds+bounces-4334-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503DEA6B72A
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 10:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68915175E1B
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 09:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A0C1EEA39;
	Fri, 21 Mar 2025 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQBGQVQa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C71E1DF1
	for <linux-leds@vger.kernel.org>; Fri, 21 Mar 2025 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549010; cv=none; b=u/sev4Lt7fw3QxPVwh2e8hJjfLtv/KriUkz3Yo5H3bZtlB3AtNv3udb/+3jseIZ8GgCRWt6JBIhBAMQTHCLlI2OCCZ5EFjfh6bIt6IEzRiw01LMSIM0Y01TcLrx1UfgEaUUdAWdqzkClmYuDG3Of5xFZbVv1uBPdKN7cisiNX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549010; c=relaxed/simple;
	bh=z0sD9NhsIdfCbYEqv1i5/VVRw8KNMPpilvM7cvuWDsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDXaLMt7+4UQMvuffyXTv0gJQZeYBW0qx+KbaGcDleDtECXpb8wtc6AlEc8ctz2brWRZr082vNDgUQaNXKG2AxXkqf5eGOl6A2v23qO7zqQwGSQeBlexWET3r1ZDGElrwJ6gKpBThKXUVnjneXYZ8g4cyn5QCdu5NogI0venYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQBGQVQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F14C4CEE3;
	Fri, 21 Mar 2025 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742549010;
	bh=z0sD9NhsIdfCbYEqv1i5/VVRw8KNMPpilvM7cvuWDsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQBGQVQanldBo7X/3jZz5dgu6IYUc8JUNYs1vjT8NBKhNdf090pM+XyJ5EyI3Tm3o
	 PDNkTfO6GO2jxz+iCqLkF15wS+br5r1jt0Q/J5ZQUoYTcd5bJ5+ORX0QAPTr2Ur91g
	 AyuLequ/1IfQA92pw5RS3tqAInrXMGbdP0JWhD5no5PNpe2OP8zPnnsUgbIieWKRy0
	 I/R76M51+Vii7aEHD3DeC0KuSzEi36VVfUUmfowu+esZpxhE5OmymjfVECxCIgEYMJ
	 I1kB/EY6KcHhZXpK/Zu+MBCZFHG4ezoqSWbfUadP3xySoj+XSn5kA4qyJyUOez3+bZ
	 6jjaeK2BK0oOw==
Date: Fri, 21 Mar 2025 09:23:26 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: broken Simatic leds
Message-ID: <20250321092326.GE1750245@google.com>
References: <CAHp75Vfe1KWDeHGYMbXdExF-7mwA_vXHL-3_TBGyyvMZwgjrJA@mail.gmail.com>
 <20250321092257.GD1750245@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321092257.GD1750245@google.com>

On Fri, 21 Mar 2025, Lee Jones wrote:

> On Thu, 20 Mar 2025, Andy Shevchenko wrote:
> 
> > This broke build
> > 
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?h=for-leds-next&id=f33c17919d4489ccff3dd20adc5c02dad5139f09
> > 
> > Obviously you forgot to update parent Kconfig and Makefile.
> 
> Thanks for the report.
> 
> I have pushed a fix.  Please could you GTAL?

https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?h=for-leds-next&id=835a0c10d33b54607f49edffbbeaea4c4cdcc49c

-- 
Lee Jones [李琼斯]

