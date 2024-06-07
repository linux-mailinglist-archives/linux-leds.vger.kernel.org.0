Return-Path: <linux-leds+bounces-1859-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 428139000AF
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 12:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A362872C2
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 10:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F129D15D5D7;
	Fri,  7 Jun 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gFoBC5j0"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189E15D5C7
	for <linux-leds@vger.kernel.org>; Fri,  7 Jun 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755758; cv=none; b=axvlkLSjVqORqiaRa5faxJ+Q4wt/LBy2mflvC4kOF/RmWmQpyF4UpdG5tyNCZSBQN26F5ayfYnGQjn8QnV+d6reP0fLOt5gpJjfUojoHvNtNYTiVrgE3FMCoZM67tCpx8h3ViSCehI4eDuQzQAaQxh8kN/f3QIauXTxhRa8Sups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755758; c=relaxed/simple;
	bh=rcBEW0Mr4u9fwZ4p8tY8v7PWVht/UnQFgnWDy9PaHts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsjyAWUBRVpkIjuYRtWNTKMQNdMyRuf8Dmhmf4Q2ktlyzGlOz2MUjsvDXNMraSTkFbK67scWRi4WMQMUEJclch0y8aR9jgQLjBjnHqGWwWvyLOHtKP2ppMhxqnLFyephPEI6xwWSbSRXujHLiU9znSc9T7XECR9MWAPnk92lTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gFoBC5j0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717755756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Wn7Qb8Mkz7q9oltxrr1ERV/8OiuusC6lmrqvkx74lM=;
	b=gFoBC5j03l6Pkjab6LT+otQEEtWNc8A5MhB8iKyTawmDo/EyllpWNXWdmuLH90qVIFkPPq
	2KYO3vuw/AQSjC/vOFBsXMPQDgqCkPDrJ0mBAk7qJnpqMQD6mWMK8JFV1qTVcpicp7aSpI
	MYPWtuq78eX8USz2dd7kydcM4VLmBeI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-qUdYCzvYPTCzImHYgUyp4A-1; Fri, 07 Jun 2024 06:22:35 -0400
X-MC-Unique: qUdYCzvYPTCzImHYgUyp4A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57a7946685aso1193258a12.2
        for <linux-leds@vger.kernel.org>; Fri, 07 Jun 2024 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717755754; x=1718360554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Wn7Qb8Mkz7q9oltxrr1ERV/8OiuusC6lmrqvkx74lM=;
        b=h/eNVTktXwt/l3i0NkGOmK3uJsJNmYerp3IKW/p0ub1uoKg3tBWzjbP8Yi7e3J2M0E
         emUyqbjCsXOoJnZgGOp4oAHSJLacCqwRsS6Ln7F1FvBDLMquhci58QaOdmeB2mWkD0K4
         5Wd4vFzz1Nu65XUP8wtQsCRyyGzuLvZSbaWbNA81g1KR+PN8jbzWQZCNNn/oXgeqQ8Hf
         wZxMtRb9on0JeqfLRqYd3PTt60cRfjbFuF0x7Uh2br9UNziz+kXQctAIxBrqb5f3YaRI
         QurldouYZ1bEptbExC2icp3EDzq1f4spGGZzpY6wuSIOM+t1WBrRk3ZeIt4F06mG91gZ
         v9sg==
X-Forwarded-Encrypted: i=1; AJvYcCWJSkEyVCRmBmTlLbJUmHSOhSuLiK7F726jIbQQ51Wv63zEetXu1+CHs9vAdyMVxZTImInFJIKmjBkaLSfochE21ndNrKBIS+r79A==
X-Gm-Message-State: AOJu0YxkBe2oqWNlXmLQVwF8lwguRRUrbBgREJgu299IZ8IpP+CVwqfX
	ioBCNhJA+2GDLagdxJmGrk17OcQAukRdvEOSvUwEpxiJ+bjaeKbTDtLx6qE8kvGLknHu2GP8EsZ
	wwI14KTWDBpbakTNDpTM5SWdM+WykzyjcRChrw5TAIT++qTz+OOEFocf6qIA=
X-Received: by 2002:a50:96c4:0:b0:57c:5b7a:87e7 with SMTP id 4fb4d7f45d1cf-57c5b7a88abmr710600a12.14.1717755754006;
        Fri, 07 Jun 2024 03:22:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF39zkfMJP4EoKX9Te7vqm+TaR62viRtVl5zDerIdnaWEEs997C8bzrL6WCAEerjlrlQx641w==
X-Received: by 2002:a50:96c4:0:b0:57c:5b7a:87e7 with SMTP id 4fb4d7f45d1cf-57c5b7a88abmr710578a12.14.1717755753570;
        Fri, 07 Jun 2024 03:22:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae23a0d7sm2513301a12.95.2024.06.07.03.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 03:22:33 -0700 (PDT)
Message-ID: <dfb48278-8b7b-401d-ae8e-579d80e3c258@redhat.com>
Date: Fri, 7 Jun 2024 12:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Genes Lists <lists@sapience.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
 <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
 <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
 <20240606063902.776794d4@kernel.org>
 <d47dcc8b4e429c676db7ad6daf8024a97f725582.camel@sapience.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d47dcc8b4e429c676db7ad6daf8024a97f725582.camel@sapience.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gene,

On 6/6/24 4:25 PM, Genes Lists wrote:
> On Thu, 2024-06-06 at 06:39 -0700, Jakub Kicinski wrote:
>> On Thu, 6 Jun 2024 15:12:54 +0200 Andrew Lunn wrote:
>>>> So it has been almost a week and no reply from Heiner. Since this is
>>>> causing real issues for users out there I think a revert of 66601a29bb23
>>>> should be submitted to Linus and then backported to the stable kernels.
>>>> to fix the immediate issue at hand. 
>>>
>>> Agreed.
>>
>> Please submit..
> 
> I assume this deadlock is unrelated to the filesystem stalls reported here:
> 
>    https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811.camel@sapience.com/ <https://lore.kernel.org/lkml/da8710eddca32677cf3c195000416121045eb811.camel@sapience.com/>

Right that one is unrelated, but the revert which I just submitted should
fix your other report:

https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/

I believe you have already worked around that one by blacklisting
the ledtrig-netdev module.

Regards,

Hans




