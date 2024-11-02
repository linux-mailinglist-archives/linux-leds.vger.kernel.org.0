Return-Path: <linux-leds+bounces-3241-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D29BA307
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 00:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C892BB224F7
	for <lists+linux-leds@lfdr.de>; Sat,  2 Nov 2024 23:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C271A0B07;
	Sat,  2 Nov 2024 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="fp3KCrPE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D2158DC4;
	Sat,  2 Nov 2024 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730589785; cv=none; b=NY3LF2GstXgd06aVSAFrnYc17iG5hIRg0yZyCOPb42mpNho1JWNVuL2xVVV2o9KnEymuKTRzrCdAJ4dVF0GFer7cZx31ALr7z2lhhXgMBSLTUGWJGqlO0ivWfRyl6aiijLJ01n99SsaUvtilZeullh1HERBa9hDO8tf45ZsQlVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730589785; c=relaxed/simple;
	bh=YJ3sYPc+iG4EtVbZOeXZIZMMgFvSsgjeYHInbchlMXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J0vod+Wgo9npqaMMD6eeJoybKPTul1UVs2YNgtMXom14shxmZBQH0OUjMJh6qa2SIC2aRfgthcaVIHoySvrIvL5bp6+A/aStkGT8SLpC8rrMHuy4k+ZBXJ4xARsl0IPwkbOc5GaKYyE/EYFPwCAyR1QI/FxIAElpZFkDKiQ3YIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=fp3KCrPE; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 42671100004;
	Sun,  3 Nov 2024 02:15:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 42671100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730589319;
	bh=QPWimwSMLRZZhnlPIYt85z2yTmcu2PSWskgTqEezw+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=fp3KCrPEMPvQlFJ2TWYiamiDWZZhTroLlRKBcnzSvPMaQS5wcuH9BGjwwpSvTHTwP
	 xEgkLsK1oyKoyYbVX1cA3XZchUk9sGwkE435dQuvHW2h/gG8aZAazslUK7cyk4/QiJ
	 hEjsI0NfPkP4YMqUIweJEt1cMRZhp6zrsH0olHP36AuDR7YI8klIehTcm5Nb7coRLD
	 mQ8CkhzDNYc67fKbbHzSIC8QSdxOn31EwtHHVSMHxa4gM8JHju6AGBfuwXuH42tqiT
	 5wkKK4ciwDk8mkBBJSRWIAkvJXqfvlXB82oi49j0kQyuOGMMra9L72JIzvQ087cl2c
	 qk1nDIleXTy4A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  3 Nov 2024 02:15:19 +0300 (MSK)
Message-ID: <aa96e9ab-00d6-413b-a7e8-8c709087f5bc@salutedevices.com>
Date: Sun, 3 Nov 2024 02:15:18 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: pwm: Add default-brightness
 property
To: Krzysztof Kozlowski <krzk@kernel.org>, <robh@kernel.org>
CC: <pavel@ucw.cz>, <lee@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-leds@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20241101154844.1175860-1-gnstark@salutedevices.com>
 <20241101154844.1175860-2-gnstark@salutedevices.com>
 <ngwfccj55vovsaj5bdealdidgxdrxfl7nwxfdqponqzdiv3olo@epzabbxkdzxb>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <ngwfccj55vovsaj5bdealdidgxdrxfl7nwxfdqponqzdiv3olo@epzabbxkdzxb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188949 [Nov 02 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, elixir.bootlin.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/02 22:22:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/02 22:22:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/02 20:58:00 #26807587
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Krzysztof, Rob

Thanks for noticing it, missed the tag not by purpose, sorry about it.
Sure I'll add the tag to v3 if v3 happens.

On 11/2/24 16:06, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 06:48:43PM +0300, George Stark wrote:
>> Optional default-brightness property specifies brightness value to be
>> used if default LED state is on.
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   Documentation/devicetree/bindings/leds/leds-pwm.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation: Please add
> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
> or above your Signed-off-by tag. Tag is "received", when provided
> in a message replied to you on the mailing list. Tools like b4 can help
> here. However, there's no need to repost patches *only* to add the tags.
> The upstream maintainer will do that for tags received on the version
> they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards
George

