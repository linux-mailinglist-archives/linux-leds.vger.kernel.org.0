Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7336656904
	for <lists+linux-leds@lfdr.de>; Tue, 27 Dec 2022 10:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiL0Jrm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Dec 2022 04:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbiL0Jrg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Dec 2022 04:47:36 -0500
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CC26467
        for <linux-leds@vger.kernel.org>; Tue, 27 Dec 2022 01:47:35 -0800 (PST)
Received: from pro2.mail.ovh.net (unknown [10.109.156.173])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 82551147C04F3;
        Tue, 27 Dec 2022 10:47:33 +0100 (CET)
Received: from [192.168.1.41] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 27 Dec
 2022 10:47:33 +0100
Message-ID: <e188c3e1-8068-91fc-4fe4-b0c65fcb7ec1@traphandler.com>
Date:   Tue, 27 Dec 2022 10:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 4/6] leds: class: store the color index in struct
 led_classdev
To:     Lee Jones <lee@kernel.org>
CC:     Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20221117160447.294491-1-jjhiblot@traphandler.com>
 <20221117160447.294491-5-jjhiblot@traphandler.com>
 <CAHp75VfMdGRz5mqhQDZT3ozwmYF2OmT8uk1yGMHXLf5Z-m_tUw@mail.gmail.com>
 <662ed1bc-c513-fb58-9f74-060a2bc4c3f4@traphandler.com>
 <Y6WkWUIZe1YLQIFO@google.com>
Content-Language: en-US
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <Y6WkWUIZe1YLQIFO@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG4EX2.emp2.local (172.16.2.32) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 13777918638329838065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedriedtgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepvdefkedugeekueeuvdeuueevjefftddvtefhleekhfefffdtteetffeigfdvtdeinecukfhppeduvdejrddtrddtrddupdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehvdekpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 23/12/2022 13:51, Lee Jones wrote:
> On Fri, 09 Dec 2022, Jean-Jacques Hiblot wrote:
>
>> Hello Pavel,
>>
>> I haven't had feedback on this series from the maintainers for some time
>> now.
>>
>> I understand that you're quite busy, but I'd appreciate if you could have a
>> look at it.
> Not in my inbox.  Would you be kind enough to submit a [RESEND] please?

Certainly. I'll do it right away.

  Thanks

>
