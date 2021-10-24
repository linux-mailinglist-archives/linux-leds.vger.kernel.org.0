Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7A8438B31
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 20:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhJXSF4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 14:05:56 -0400
Received: from phobos.denx.de ([85.214.62.61]:43588 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhJXSF4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 24 Oct 2021 14:05:56 -0400
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6ECC882D5B;
        Sun, 24 Oct 2021 20:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635098613;
        bh=mwfxftu8YhC5UyjL984LKn9i84rQthJV66NQq7G7LA0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=c13M6kYe7d0WecbmeZyBITXbQCw831hC5S22qgR8yMginODbYuVT42WVdBUWjX/a3
         W9R5QzT9XU5iVQucnXuejR4ISfH1PZq1T1WpwBbvENHk+CERS22QnjB0EI3+rV2+5+
         adoZNubgL4q/BGPU3//JS10z4pXk69vEMz5bh+MkWDrPNLhXT2qYQrzMysxg9Nyq8P
         9u+ugoftQEOYVbKQssK+OsnGTmdiHxnnXncmj9fswcPbipu0cYCEsrMhycle20py99
         s2iSqD4s56VEQVfCB43wvs0cmZ26utbKnZw9YhPJuouCxgTP9ALpc6whZj4PNLIyaO
         GCcgyRfIuvTQQ==
Subject: Re: [PATCH 2/2] dt-bindings: leds: Document mmc trigger
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20211024002358.225750-1-marex@denx.de>
 <20211024002358.225750-2-marex@denx.de> <20211024084010.GA32488@duo.ucw.cz>
From:   Marek Vasut <marex@denx.de>
Message-ID: <dc499e2d-6f15-d556-b61d-b4b5748ea98a@denx.de>
Date:   Sun, 24 Oct 2021 20:03:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211024084010.GA32488@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/24/21 10:40 AM, Pavel Machek wrote:
> Hi!
> 
>> The mmc subsystem supports triggering leds on card activity, document
>> the trigger value here. The value is a pattern in this case.
> 
> I don't believe this is suitable as devicetree does not know about mmc
> numbers.

There are multiple instances of this trigger type in existing DTs, see:

$ git grep linux.default-trigger.=..mmc | wc -l
85

So what alternative do you suggest ?
