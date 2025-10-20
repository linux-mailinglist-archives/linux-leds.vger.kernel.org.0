Return-Path: <linux-leds+bounces-5823-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D170BF004E
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 10:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA80334A70D
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 08:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4534B2E542C;
	Mon, 20 Oct 2025 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="YxDMr3CS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F912CDA5;
	Mon, 20 Oct 2025 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760950049; cv=none; b=nanuPHUZGeunxQ9DjJ/X6VvtrcOWj1aEIrZ/57O3aTk2lSbVAlSKjNEVO1PYHbB0u/2VW3SuSVkiPMGurnkmM/1aCNzQhMxPImYxiF5hUVLbcqb9zYQ6dKo1Zthlkvd8RPz30bqK/eIkiVOBKKmequBRTWPmG8nazdld30r6MyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760950049; c=relaxed/simple;
	bh=mQloorznQzMXW/ynd/wR0CyEH1zh5MuIhN6wLVl0CQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO7qKFeZpq4a8/JNPxmPSNNg1FCQa9bzXiesqdEm1XS/OXd2pz91WyFy2y/9Ay5r8NfZ0/1HXn5asN4wxQeWSuvGW1vayAbj3Gdjc1Q1N5C5i2y6jz4eNGyX15quMZXVU91kJgwGAecS8zfR6a3Ofl+jamGiELhCTC8yLSBucYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=YxDMr3CS; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1844A1484217;
	Mon, 20 Oct 2025 10:40:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1760949626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=T6wPZ3WB9JpcoMQ6v8FehHy/D2s2JJXCVySDKGuR5lE=;
	b=YxDMr3CSbqbbS4mkkG+lAVk64yeOp8THqs0e0H6ih6grcyJNzgQp2LqgGd9TMjUx4uPupo
	IAs5AcKBeGrcqK3IG/8TcX1u1vDV+p7zb3gOyZCIweDv4s9ggkg0wIDeWyklcPoG5EwckJ
	6Uw1uXlcyFQ8Rt5lYKnTS61p0oIigNZ/7yhEjYSU+HtG81xbEt4l6c7nwNri62S/xlFlHc
	wYyIsIMoVivyO0V/JmHZMGslhGjXZOtwMPCdwgnkeql/Qn+qHIxYW83FYTEPZPdDtxzZNZ
	PbsknZjDh+KDaZndG/EG8Ins9k1gSVaQrqma7k0m5sFR7aiRgUg19tQyFBNC3A==
Date: Mon, 20 Oct 2025 10:40:23 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 0/4] leds: Add a virtual LED driver for groups of
Message-ID: <20251020-retorted-obsession-21780c6baf47@thorsis.com>
Mail-Followup-To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
References: <20251019092331.49531-1-professorjonny98@gmail.com>
 <3df51774-9774-40e6-ae65-7621bdce0f91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df51774-9774-40e6-ae65-7621bdce0f91@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hei Jacek,

Am Sun, Oct 19, 2025 at 04:24:38PM +0200 schrieb Jacek Anaszewski:
> Hi Jonathan,
> 
> On 10/19/25 11:23, Jonathan Brophy wrote:
> > From: Jonathan Brophy <professor_jonny@hotmail.com>
> > 
> > Introduce a new driver that implements virtual LED groups,
> > aggregating multiple monochromatic LEDs into virtual groups and providing
> > priority-based control for concurrent state management.
> 
> Aren't you trying to reinvent LED trigger mechanism?

Instead of using virtual LEDs, could this be implemented as a
"virtual" trigger which allows grouping (and prioritizing) multiple
other triggers, and apply that to only one existing LED?

Greets
Alex


