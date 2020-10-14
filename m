Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FBD28DB07
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbgJNITj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgJNITe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:19:34 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97601C04586C;
        Tue, 13 Oct 2020 22:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=VBhfFbcum7XqbvqnX65rC2cJinR64wvSqBnpbpj4otY=; b=bnhC0zvB0LmWbSJHu5QthQHi3+
        D3vU89kUm7mR9S1RpJwfliTGWEBvzkNupZKuzr1SPTGMHEv1LXTdW42vUw0CYXWUIgv1/fXcvwHyL
        qE8+/PwM3wArw7HqzNbb8lCSmHzX1SXQC5k20esROfvocGUfqmZ393Ec76b19KhNVxFR1jGjQdxfe
        +7/N297i0jo8SKe1J1DE1WUKiplPpWRwc6q8eWAjR8g8iRMh4khoX4QmCuLoEbYFXBpHefJpQf8zy
        xAqfBfMpKL+B04FbzJKTY3qApVK1i34M+C18ISTzWb9spLCoepokBzMNXmcHeBEZgz1EyTA84Ko/N
        KgHivglg==;
Received: from [2601:1c0:6280:3f0::507c]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSZjv-0001kM-VH; Wed, 14 Oct 2020 05:54:20 +0000
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
To:     Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>, Takashi Iwai <tiwai@suse.de>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
Date:   Tue, 13 Oct 2020 22:54:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/13/20 10:16 PM, Udo van den Heuvel wrote:
> On 14-10-2020 07:07, Randy Dunlap wrote:
>> On 10/13/20 9:56 PM, Udo van den Heuvel wrote:
> 
>>> I.e.: it looks like I will lose some funcionality when I disable
>>> SND_HDA_CODEC_REALTEK.
>>
>> OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_REALTEK
>> with no LEDS. That driver apparently wants LEDS.
> 
> Thanks but why have I gone for years without LEDS?
> I do not need LEDS, I do not want LEDS, I do not have LEDS (that are
> visible, usable, etc).
> 
> Please make this selectable instead of forcing more bulk into my kernel.
> 
> Kind regards,
> Udo

Hi Takashi,

Regarding
commit 7cdf8c49b1df0a385db06c4f9a5ba1b16510fdcc
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jun 18 13:08:31 2020 +0200
    ALSA: hda: generic: Add a helper for mic-mute LED with LED classdev

and this Kconfig entry:

config SND_HDA_CODEC_REALTEK
	tristate "Build Realtek HD-audio codec support"
	select SND_HDA_GENERIC
	select SND_HDA_GENERIC_LEDS

it seems that LED support is not always wanted (please see above).
I.e., user(s) would like to build a kernel without LED support at all.

Can you make it a build option?

thanks.
-- 
~Randy

