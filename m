Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372D76F1824
	for <lists+linux-leds@lfdr.de>; Fri, 28 Apr 2023 14:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345390AbjD1MjZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Apr 2023 08:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjD1MjY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Apr 2023 08:39:24 -0400
Received: from 3.mo562.mail-out.ovh.net (3.mo562.mail-out.ovh.net [46.105.33.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F80180
        for <linux-leds@vger.kernel.org>; Fri, 28 Apr 2023 05:39:23 -0700 (PDT)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
        by mo562.mail-out.ovh.net (Postfix) with ESMTPS id 24BA522C96;
        Fri, 28 Apr 2023 12:39:21 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <andy.shevchenko@gmail.com>; Fri, 28 Apr 2023 12:39:20 +0000 (UTC)
Received: from pro2.mail.ovh.net (unknown [10.108.1.157])
        by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id CE020201C9B;
        Fri, 28 Apr 2023 12:39:20 +0000 (UTC)
Received: from [192.168.1.41] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 28 Apr
 2023 14:39:20 +0200
Message-ID: <4c3bdb25-47b9-3442-860d-2c77f8e9f861@traphandler.com>
Date:   Fri, 28 Apr 2023 14:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 0/6] Add a multicolor LED driver for groups of
 monochromatic LEDs
Content-Language: en-US
To:     <lee.jones@linaro.org>, <andy.shevchenko@gmail.com>
CC:     <linux-leds@vger.kernel.org>
References: <20230328161541.599463-1-jjhiblot@traphandler.com>
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <20230328161541.599463-1-jjhiblot@traphandler.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: CAS4.emp2.local (172.16.1.4) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 13724719868030040561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedukedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeflvggrnhdqlfgrtghquhgvshcujfhisghlohhtuceojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefudekvedugffhteduvefhhffhkeejiedugedtheeuvefgvdegiedvieefvdenucfkpheptddrtddrtddrtddpkeekrdduiedurddvhedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepughirhgvtghtohhruddruggvrhhprdhmrghilhdqohhuthdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedv
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 28/03/2023 18:15, Jean-Jacques Hiblot wrote:
> Some HW design implement multicolor LEDs with several monochromatic LEDs.
> Grouping the monochromatic LEDs allows to configure them in sync and use
> the triggers.
> The PWM multicolor LED driver implements such grouping but only for
> PWM-based LEDs. As this feature is also desirable for the other types of
> LEDs, this series implements it for any kind of LED device.
> 
> changes v7->v8:
>   - consistently use "LEDs group multicolor" throughout the code.
>   - rename some variables with more explicit names.
>   - improve comments.
>   - use the 100-characters per line limit.
> 
Hi Lee,

Are there any pending items regarding this series ?
If not, can you consider merging it ?


Thanks,
JJ
