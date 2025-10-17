Return-Path: <linux-leds+bounces-5807-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FDBEB0E8
	for <lists+linux-leds@lfdr.de>; Fri, 17 Oct 2025 19:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3122540198A
	for <lists+linux-leds@lfdr.de>; Fri, 17 Oct 2025 17:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CED2FC02A;
	Fri, 17 Oct 2025 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Zj0wxQXN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECE02F12C5;
	Fri, 17 Oct 2025 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760721605; cv=none; b=tuK+ZlCA09ZKucKvd+pImJl7jA01TBqTQT6nH/RW5utjZ39clIeoNwK78TvFKKfIoP2USCAvnvqDHYIJ5kmfnlBID+SjfEpjttRW/cjotPcbC8Cgem5wkWZz/+EPiUQ2jC0UQNtmASTq6SDYs4AWgglvmWHaGssfwxnJHJVU1WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760721605; c=relaxed/simple;
	bh=7eU7v/gSC0RzDIzvKfvaFqAYhZNli1o2i++9MEqwsx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdmFokb00R83Mzdpt06ZXaQiP8qo7Q3i61H7RgVYr9wNtzRiKaQSOJV9GrqG7CUbjdzlWHR6vQM4bcNZ04BYynk7TZiU/VY7gpAYvA4JhrWRJbyFR+pfffrkGCInk/g+K0vn+rOOt5Z1PF1juFohPrNw4qPuhwAqMmp0+Ks0V68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Zj0wxQXN; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1760721594; x=1761326394; i=w_armin@gmx.de;
	bh=7eU7v/gSC0RzDIzvKfvaFqAYhZNli1o2i++9MEqwsx8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zj0wxQXNNdqjZCTpsdow9yVms4KFeFOAGc50xiaYuByALRsj6Colh7iOhLH3XMU5
	 LEA0St2OybTBBpNvvtqbb3IqKgXJP+G7q5j0PQDu8eZ+UtO6eG88wrhf5LLYXcOvm
	 vjzphkV6J3HD4TsEZtpCpdzdlEsqMpCowa1ZP664xu5IBkQIrq+Awv0ykotGcrv05
	 JlB2qyVtKad2CnrrX1cYgwZ43H35iM8SNVlBaHDBPHsVG23xUA72KgI75Ad8LcPk5
	 sic7kAw6cOwrhSCMgpO0BcIBv1VyTtfs1B74zv+XYSFOCw/1htAYg7jc8BnPcN0MT
	 weNsKeq3IGue4Dmiug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1uJM5b1Z57-00s3Qg; Fri, 17
 Oct 2025 19:19:54 +0200
Message-ID: <9e63e9de-b9af-478d-90ad-d7fca59aaea8@gmx.de>
Date: Fri, 17 Oct 2025 19:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 rdunlap@infradead.org, alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org,
 lee@kernel.org, pobrn@protonmail.com
References: <20250928013253.10869-2-W_Armin@gmx.de>
 <202509290415.uez00SgW-lkp@intel.com>
 <6146d57b-f855-40b1-a644-3af6b28ceea4@gmx.de>
 <20251002233627.GA3978676@ax162>
 <402f254d-7217-43e8-867f-66daab3ead86@gmx.de>
 <20251006190819.GA2406882@ax162>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251006190819.GA2406882@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jCSIiP7A6/WJzpkIJUGLnWIYZcVxQ9zb8ydRgCPk+KAJhj21Bv2
 EAmRmKRWIhyIjuXJO1lK+h874W8vKgW86aa1+da4H/uROVBGO64TQ87XW2oT9D7PgV5EXub
 3NmbZlA7Xamb6zV6a+CaAYQmdWS7m2D8tyN+3/oZdx04tAs90l0NHzJOYMfLoDvmpeB4hJ/
 3xfRDB0ekigEWsB7Ps5tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7yuLrp7jHU4=;htu/TOWIHCm/XbqooOOdUQU0HS3
 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
 ybqGNhTrDQNBfLiyib/JoIaDALit7rKmPU4=

Am 06.10.25 um 21:08 schrieb Nathan Chancellor:

> On Sun, Oct 05, 2025 at 08:06:57PM +0200, Armin Wolf wrote:
>> Am 03.10.25 um 01:36 schrieb Nathan Chancellor:
>>
>>> Hi Armin,
>>>
>>> On Thu, Oct 02, 2025 at 08:41:19PM +0200, Armin Wolf wrote:
>>>> i think this is a problem inside the clang compiler. I did not encounter this warning when
>>>> build for x86-64 using gcc.
>>> Clang is actually saving you from yourself, it is a bug in GCC that it
>>> does not warn for this:
>>>
>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91951
>> Oh my, i didn't expect that. Thank you for explaining this issue to to me,
>> it seems that i still have much to learn.
> In your defense, it is quite a subtle interaction. It is probably worth
> throwing something in the documentation that explicitly calls this out,
> though I am not immediately sure of where...
>
> Cheers,
> Nathan
>
Maybe Documentation/core-api/cleanup.rst would be a suitable place for warning
people about this.

Thanks,
Armin Wolf


