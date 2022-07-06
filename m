Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E74E568C7F
	for <lists+linux-leds@lfdr.de>; Wed,  6 Jul 2022 17:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiGFPTx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Jul 2022 11:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbiGFPTw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Jul 2022 11:19:52 -0400
X-Greylist: delayed 7794 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Jul 2022 08:19:51 PDT
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EE4DFE9
        for <linux-leds@vger.kernel.org>; Wed,  6 Jul 2022 08:19:50 -0700 (PDT)
Received: from player759.ha.ovh.net (unknown [10.110.115.111])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id C48A12401A
        for <linux-leds@vger.kernel.org>; Wed,  6 Jul 2022 12:54:29 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player759.ha.ovh.net (Postfix) with ESMTPSA id 23AA82C62D3DC;
        Wed,  6 Jul 2022 12:54:19 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-98R0021715cc91-ca2c-4e6d-985b-220cb5972dbf,
                    9C20F4AFB6E1A5C03E66B265D4B61152F87D618A) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <361c9fc9-e982-55d3-f780-405505fd4389@milecki.pl>
Date:   Wed, 6 Jul 2022 14:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] dt-bindings: leds: add Broadcom's BCM63138
 controller
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh@kernel.org>
References: <20211227145905.2905-1-zajec5@gmail.com>
 <1ca1d83d-9803-77a3-e5bb-2380a2dc03b0@gmail.com>
 <223aabc8-7ec3-2719-866a-8f35ab97a11f@gmail.com>
 <1273c272-b6fe-2980-ce66-582738722634@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <1273c272-b6fe-2980-ce66-582738722634@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9657124978954709818
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeeuleetudfgkeevfffggeffveevleeutdekkeejueekveevtefhhfegveeggefhudenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedt
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 27.04.2022 22:47, Rafał Miłecki wrote:
> On 27.03.2022 11:28, Rafał Miłecki wrote:
>> On 7.03.2022 07:27, Rafał Miłecki wrote:
>>> On 27.12.2021 15:59, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
>>>> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
>>>> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
>>>>
>>>> The newer one was also later also used on BCM4908 SoC.
>>>>
>>>> Old block is already documented in the leds-bcm6328.yaml. This binding
>>>> documents the new one which uses different registers & programming. It's
>>>> first used in BCM63138 thus the binding name.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>>>
>>> Pavel: can I get this patchset finally accepted, please?
>>
>> It has been 3 months now. I kindly pinged you in January, February and
>> March. Please let me know how can I get those patches accepted.
> 
> did you maybe have a chance to look at my patches?

I'm asking to get this reviewed / accepted for half a year.
