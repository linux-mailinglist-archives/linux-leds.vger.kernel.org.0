Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5E46487CF
	for <lists+linux-leds@lfdr.de>; Fri,  9 Dec 2022 18:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLIRd6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Dec 2022 12:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiLIRd5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Dec 2022 12:33:57 -0500
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8A06BC83
        for <linux-leds@vger.kernel.org>; Fri,  9 Dec 2022 09:33:55 -0800 (PST)
Received: from pro2.mail.ovh.net (unknown [10.109.138.144])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 0BFCF142ECF63;
        Fri,  9 Dec 2022 18:33:51 +0100 (CET)
Received: from [192.168.1.41] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 9 Dec
 2022 18:33:51 +0100
Message-ID: <662ed1bc-c513-fb58-9f74-060a2bc4c3f4@traphandler.com>
Date:   Fri, 9 Dec 2022 18:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 4/6] leds: class: store the color index in struct
 led_classdev
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <jacek.anaszewski@gmail.com>,
        <linux-leds@vger.kernel.org>, <kabel@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20221117160447.294491-1-jjhiblot@traphandler.com>
 <20221117160447.294491-5-jjhiblot@traphandler.com>
 <CAHp75VfMdGRz5mqhQDZT3ozwmYF2OmT8uk1yGMHXLf5Z-m_tUw@mail.gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <CAHp75VfMdGRz5mqhQDZT3ozwmYF2OmT8uk1yGMHXLf5Z-m_tUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: CAS1.emp2.local (172.16.1.1) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 8178536924172728711
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepieejfedukeevudfghfetudevhffhhfekjeeiudegtdehueevgfdvgeeivdeifedvnecukfhppeduvdejrddtrddtrddupdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghvvghlsehutgifrdgtiidplhgvvgdrjhhonhgvsheslhhinhgrrhhordhorhhgpdhjrggtvghkrdgrnhgrshiivgifshhkihesghhmrghilhdrtghomhdplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhkrggsvghlsehkvghrnhgvlhdrohhrghdprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhohedvkedpmhhouggvpehsmhhtph
 houhht
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

I haven't had feedback on this series from the maintainers for some time 
now.

I understand that you're quite busy, but I'd appreciate if you could 
have a look at it.

Thanks,

Jean-Jacques

