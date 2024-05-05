Return-Path: <linux-leds+bounces-1588-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C118BBF62
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 07:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 179131C20AC9
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 05:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEAA23B0;
	Sun,  5 May 2024 05:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="jpj+ZZHf"
X-Original-To: linux-leds@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EC1C36;
	Sun,  5 May 2024 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714888095; cv=none; b=uPH0oXL7uLRaMcbQLHUxgfB7lPFlIevycEuErvuAeKB7MYIOF9qdqHzMnp0AyMy0+gXvmkdzHGAkqxaT21/w/LBFIr+WCSTabR8ygcEGafRVWRqgtpkHfpi8uTY/pcOw7vuLtFPQe4E/AI7MsS2ISxRM9RtPLd1Jhgth3tDki3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714888095; c=relaxed/simple;
	bh=Ed8HsUbSumQ8fSGK08zare9btHAsdVUl3Gt9W/0+ruA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkhbDrJQiKCKZjM52UcHagym0xoKx5zeLaBmrytdo4UVUphvigF4yxkRuW78r5Ox2CHOdIUn+sDRXPG10dubxqIbM1B553Jip060n066EUEk/ykJK/H+pvpGzQCkNbSLpDqTVjtLJdWWCadvDOtxogTeXwN9kEqdRF/XT2AXlZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=jpj+ZZHf; arc=none smtp.client-ip=67.231.154.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id CF778500FDF;
	Sun,  5 May 2024 05:48:12 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id DE2F26C0067;
	Sun,  5 May 2024 05:48:04 +0000 (UTC)
Received: from [192.168.2.14] (80-61-14-254.fixed.kpn.net [80.61.14.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 4EB6813C2B0;
	Sat,  4 May 2024 22:48:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 4EB6813C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1714888084;
	bh=Ed8HsUbSumQ8fSGK08zare9btHAsdVUl3Gt9W/0+ruA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jpj+ZZHf3xR+PkEOFdSiCzFanG6MfPIfptoRe0FsNRl/kVouyLaDw5lHtlgmFbkJv
	 rDKoFAEJ7pPw6FJqe8FWo0JvqUoBdaSLVR45EZF50DXxUM0o/eo+QFjijGP8VAVKdL
	 Cl5OS3nMCG+gqZaN4szg1GXU4/J1wwWXNH5ouINI=
Message-ID: <8054cc9c-fbfe-a08d-5968-57b90a25af65@candelatech.com>
Date: Sat, 4 May 2024 22:48:01 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: 6.9.0-rc2+ kernel hangs on boot (bisected, maybe LED related)
Content-Language: en-MW
To: Lee Jones <lee@kernel.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com>
 <30819e01-43ce-638f-0cc6-067d6a8d03c7@candelatech.com>
 <89a9eec3-337f-3c9f-6bbe-00a26a15287c@candelatech.com>
 <20240411070718.GD6194@google.com>
 <de43c7e1-7e8c-bdbe-f59e-7632c21da24a@candelatech.com>
 <8736ebc8881e1e0cabfbbf033725a3123a5e8e90.camel@sipsolutions.net>
 <bc420f3a-5809-4c4a-80ad-ccd8a46853b6@leemhuis.info>
 <8ab88be5de30bcbd0d1cac3cfde6b2085dcfc8fb.camel@sipsolutions.net>
 <0197efe8-828b-43ae-85c9-5d521913a289@leemhuis.info>
 <20240502071908.GB5338@google.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20240502071908.GB5338@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1714888086-kOSWpmmwirJ5
X-MDID-O:
 us5;at1;1714888086;kOSWpmmwirJ5;<greearb@candelatech.com>;c63a44cdfc35f48c78127675e18807b4

On 5/2/24 00:19, Lee Jones wrote:
> On Tue, 23 Apr 2024, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
>> On 23.04.24 11:06, Johannes Berg wrote:
>>> On Tue, 2024-04-23 at 11:00 +0200, Linux regression tracking (Thorsten
>>> Leemhuis) wrote:
>>>> On 16.04.24 08:17, Johannes Berg wrote:
>>>>> On Mon, 2024-04-15 at 13:37 -0700, Ben Greear wrote:
>>>>>>
>>>>>> Johannes, you had another suggestion: changing iwlwifi's request_module() to request_module_nowait() in
>>>>>> iwl_req_fw_callback()
>>>>>>
>>>>>> Is that still best thing to try in your opinion?
>>>>>
>>>>> I guess so, I don't have any better ideas so far anyway ...
>>>>
>>>> [adding the iwlwifi maintainer; thread starts here:
>>>> https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
>>>>
>>>> ]
>>>>
>>>> Johannes, Miri, what's the status wrt to this regression? From here
>>>> things look somewhat stalled -- but maybe there was progress and I just
>>>> missed it.
>>>
>>> What do you want? It got bisected to an LED merge, but you ping _us_?
>>> Way to go ...
>>
>> Sorry, to me it sounded a bit like you had an idea for a fix and were
>> going to give it a try -- similar to how the maintainers for a r8169
>> driver and the igc driver provided fixes for bugs recent LED changes
>> exposed.
>>
>> But sure, you are right, in the end some LED change seems to have cause
>> this, so the duty to fix it lies in that field. Therefore:
>>
>> Lee, what's the status here to get this fixed before the final?
> 
> No idea.  Did you send a fix?

I sent what is probably just a work-around.  I also spent time bisecting and testing.
The problem appears to have come in with the LED related merge.  I think it is fair
to ask the LED folks to at least take a look at the lockdep debugging I posted.  It is
not fair to expect anyone that manages to find or track a bug to also fix it.

If someone has a different suggested fix than the hack I posted, I will be happy to
test.  On my system with lots of radios, it is 100% reproducible.
Maybe email me directly as I don't keep close watch on LKML.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

