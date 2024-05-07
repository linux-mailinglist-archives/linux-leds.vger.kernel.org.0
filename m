Return-Path: <linux-leds+bounces-1618-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4A8BDA21
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 06:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B3BFB22951
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 04:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724BE4EB5F;
	Tue,  7 May 2024 04:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="HJx+U4Dd"
X-Original-To: linux-leds@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4642A97;
	Tue,  7 May 2024 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715055697; cv=none; b=BJWJn3jptvYxbPZSP1XRRFlvIS3Y7K/qo0VGTOicO9edLocDzQZ7hE0d1yFa5HRH3nM5MH9mNCKzX4dzPkrULbvwBrP2jDkHKMQcmDcTZTAhvNncGQRcErUJrsvx0gS/8lTqCjzoX4sOEo2oIDZ2LIp3LF4pmahxHcx8Gsg6idE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715055697; c=relaxed/simple;
	bh=c72GuTr4ExGvonfEeMmEgADVHU9OOr5JbOujrkeH2Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cetjoj1DNp3++XPpTP25/yS7GcpKQZRyZTWrz5J7bUqaP4EEMgVDNmN3q4uZCOhTBDnOsQTngC08rNfXNf6Nt+Om8guzH4fMdMkERucdGKa36S12Qzyo/d8zbI3YzNiA7QPcJkOEGPaURaCwhiSQyfU9inI1u4AQrd57z0BMnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=HJx+U4Dd; arc=none smtp.client-ip=67.231.154.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 8D97424006D;
	Tue,  7 May 2024 04:21:27 +0000 (UTC)
Received: from [192.168.2.14] (80-61-14-254.fixed.kpn.net [80.61.14.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 086E213C2B0;
	Mon,  6 May 2024 21:21:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 086E213C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1715055686;
	bh=c72GuTr4ExGvonfEeMmEgADVHU9OOr5JbOujrkeH2Bs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HJx+U4DdhKHIyPOdPTy1pSA8Jq/gSNdAEEC13Pj7JNRjgjlEscPBhK8WMzBerwiGV
	 YTUYxbw4p1JeXq7TpUd8k9yCy21+hDX1yT/psChGWeBUChc/MZN89xHsrmn7Tu9Vuv
	 Ak8rnrGoFV1OsXZgBp18ymo0wuKg5/x6PYj+F6t4=
Message-ID: <738e5de5-0916-c13d-22fb-4c9cb1213036@candelatech.com>
Date: Mon, 6 May 2024 21:21:23 -0700
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
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Lee Jones <lee@kernel.org>,
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
 <8054cc9c-fbfe-a08d-5968-57b90a25af65@candelatech.com>
 <dd5d511e-9b02-4481-b22b-28da7b188b29@I-love.SAKURA.ne.jp>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <dd5d511e-9b02-4481-b22b-28da7b188b29@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1715055688-TpvrKO0XMact
X-MDID-O:
 us5;at1;1715055688;TpvrKO0XMact;<greearb@candelatech.com>;5d67d90982e6d4d760f4a321edc7d576

On 5/5/24 03:55, Tetsuo Handa wrote:
> On 2024/05/05 14:48, Ben Greear wrote:
>> If someone has a different suggested fix than the hack I posted, I will be happy to
>> test.  On my system with lots of radios, it is 100% reproducible.
>> Maybe email me directly as I don't keep close watch on LKML.
> 
> Please collect stacktraces of all lock holders using
> https://lkml.kernel.org/r/77e32fdc-3f63-e124-588e-7d60dd66fc9a@I-love.SAKURA.ne.jp .
> 
> Depending on the output, I might ask you to decode addresses using ./scripts/faddr2line .
> 
> 

I am travelling for next few weeks, but will work on this when I return.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

