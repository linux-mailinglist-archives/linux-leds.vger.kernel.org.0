Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FDE438B39
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 20:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbhJXSIT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 14:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbhJXSIT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 24 Oct 2021 14:08:19 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CF0C061745;
        Sun, 24 Oct 2021 11:05:58 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id ADA7D82D5B;
        Sun, 24 Oct 2021 20:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635098756;
        bh=rBt3IhcwUCaMVs0BPN0wYHF1XcVI6iTY1uqMWASS6aI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rL79iQ+trwIVk09Dzai23ORNOm3JyKgNs23Q0kwmAV/5LjjxhMyOhS+Wf092p/ngY
         ZAVbkBgYwh5VxL5olE+V/2klIoyXRLknwDyQ782n+PcPuvwilb2LrU8o1ckBUDmshX
         wzy7G9sSVrQM6Ki9cZTlKaHk4um5/l/zD5ZSmKxw1jA/HF1uxyhTDbk5d9dcdmksBR
         V955e1yQtS/laBk7S4aE5YfE/sGEwOzPMHvlVw+sBhsZJvWj3YcuQfpTwIxmCEOdv+
         h2UshOtYFPS2iRu5QIdbZWsBNmbhv7xq7oPk/EXcxOsxmpRoemLxzA9hG8eikpTxe5
         ghhxWpOLW0glw==
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document none trigger
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20211024002358.225750-1-marex@denx.de>
 <20211024084135.GB32488@duo.ucw.cz>
From:   Marek Vasut <marex@denx.de>
Message-ID: <e3ea7f1d-662c-32ef-4d3d-62972af699b6@denx.de>
Date:   Sun, 24 Oct 2021 20:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211024084135.GB32488@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/24/21 10:41 AM, Pavel Machek wrote:
> Hi!
> 
>> There is a trigger called "none" which triggers never, add it to the
>> list of valid trigger values.
> 
> We can do this, but is it useful? If you avoid putting trigger
> property, it will do the same thing.

It's not that simple. If you have a DT which specifies a trigger type 
and a DTO which overrides that trigger type, then the DTO cannot remove 
the trigger from the base DT, it has to set trigger type to "none". So I 
believe there is a valid use case for existence of the "none" type.
