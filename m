Return-Path: <linux-leds+bounces-4222-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1037A5B663
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 02:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E7541892D7C
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 01:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586591E4928;
	Tue, 11 Mar 2025 01:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="WhzYC/Ir"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AC1E3787
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 01:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741658255; cv=pass; b=ICKlIjNvf/7RY6/Y3XyhtvHDo6BWfQi/ANlQRaXXhKdXUJqVEDFkLTrftgoyvvkTL2UlC3e5ZRLrbgNtjjesHPqMRzYIFj9QhBH6z1ogXW7aBeBp5xFpgo0nJ5qzZQQ62q0NZZLK7EBxG2/jOt/l1EGtW1aDaoeNSRm3xz9cY8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741658255; c=relaxed/simple;
	bh=JUBwDqDAhVLTYmIzOadFpJmsJJhAQ8M5dqS0RiovZ4U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=D8NacVWsZizKeS+m78zGpvjuSr0k4ZihYJ7qJWgWe4k44Bo35cSiZUGH2YzJBC+Qzgg8RzZirUWWt39F8GU5qJtThkXaMe0pdbEcCwKfFFLBSRLDMREAHA7fwVC2/CLHv5tHZm5/kHyqJRRu6qCoAR6Ae11HLnCKHOo9/YYH008=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=WhzYC/Ir; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741658250; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7ykZUsigmtnhjzD4gHhG7MmcKwWp3rPtmLzR0OkzZaztD+k2P1w4YeZk5fhombsyHLM3CMCFJsgaqgIvq8lYYDKN3tXnQTFA1vkBDhQGxvy9sY0BBwuWS9BLCH6fjX66++fc/P4DSMBh3ZxfQXgoMv6Jd5HRTtuWdFumLcSuXs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741658250; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kpu8QUy/GZDsBd9mD2Fa4n4DuRIjz0WpfS3x5cLSSTc=; 
	b=I6SL8a+HamjZ9Q3h6LVfFcNlW0I9Op63r6i+3XWSyMRMamv8iBAFVyicCczv/Iwg9DdDlxYRsf9hDDjaXBIt6wZ6V9fkBgBT75BYMqYQDFtX1iIvip0rhNNWiqsvhTHVoeq1sFdOCLwrfLKj29kTM2dmD2WhJjCg8MWeHhd+TAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741658250;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Kpu8QUy/GZDsBd9mD2Fa4n4DuRIjz0WpfS3x5cLSSTc=;
	b=WhzYC/IrrDh10ll51rPIwkxcZI265o3ot+lGwe4qImfFsNWZcuIcyJKNL1KUDyHR
	n5eG58Q4ZR/ssoAITgu3AETzbZyJ9Soonz3GdxlXDxpriUF73WwKmr6R9oDKvvG41Fg
	lxSO4ovfr4n5kFPnjy9ADuFEWXAvle3MmSBmV9Y8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741658248824955.9435112641249; Mon, 10 Mar 2025 18:57:28 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:57:28 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "Craig McQueen" <craig@mcqueen.au>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <19582ebd65e.12149b1db998182.1987296040364406185@mcqueen.au>
In-Reply-To: <20250311013143.371930-1-craig@mcqueen.au>
References: <20250311013143.371930-1-craig@mcqueen.au>
Subject: Re: [PATCH v2 0/1] Introduce userspace LED triggers driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

On Tue, 11 Mar 2025 12:28:06 +1100 Craig McQueen  wrote:
 > I've done some significant rework since my original submission of this. 
 >  
 > * Moved and renamed driver to drivers/leds/trigger/ledtrig-user.c, 
 > following kernel arrangement of trigger drivers. 
 > But note the char device name and uapi header file are still named 
 > 'uledtriggers'. 
 > * Fixed a mutex reentrancy issue with the 'activate' function. 
 > * Code refactoring and add comments. 
 > * Add new documentation page to index. 
 

I should also mention that I have tested this with Python test code, which is currently here:

https://github.com/cmcqueen/linux-kernel-uledtriggers


