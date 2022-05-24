Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898BC53245A
	for <lists+linux-leds@lfdr.de>; Tue, 24 May 2022 09:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbiEXHqX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 May 2022 03:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiEXHqW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 May 2022 03:46:22 -0400
Received: from smtpout1.mo3004.mail-out.ovh.net (smtpout1.mo3004.mail-out.ovh.net [79.137.123.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A938D6D380
        for <linux-leds@vger.kernel.org>; Tue, 24 May 2022 00:46:19 -0700 (PDT)
Received: from pro2.mail.ovh.net (unknown [10.109.143.121])
        by mo3004.mail-out.ovh.net (Postfix) with ESMTPS id 6F3A923CFA2;
        Tue, 24 May 2022 07:46:18 +0000 (UTC)
Received: from [192.168.1.42] (88.161.25.233) by DAG1EX2.emp2.local
 (172.16.2.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 24 May
 2022 09:46:18 +0200
Message-ID: <8cff7e38-600b-5ca3-3209-922dbafbfeb4@traphandler.com>
Date:   Tue, 24 May 2022 09:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>,
        <sven.schwermer@disruptive-technologies.com>
CC:     <linux-leds@vger.kernel.org>
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: Grouping monochromatic LED in a Multicolor LED group
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG4EX1.emp2.local (172.16.2.31) To DAG1EX2.emp2.local
 (172.16.2.2)
X-Ovh-Tracer-Id: 10180949908925921777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjedvgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvfevhffutgfgihesthejredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepveethffgtdeltefhvddtkeeuieeghfefleeiiefgjeejuefhvedvfffhgeehfefgnecukfhppedtrddtrddtrddtpdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehprhhovddrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhlvggushesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

There is a recent addition to the LED trees that combined multiple PWM 
LEDs into a RGB LED.

I need to do the same for the leds of the TLC5925.

I'm wondering if it wouldn't be better to add a generic capability of 
grouping any kind of monochromatic LEDs than to implement it only for 
the TLC5925.

I started to work on such a generic driver based on the multicolor PWM 
Led driver but most of the code is duplicated and maybe it makes sense 
to keep only a single driver.

What do you think ?


Best regards,

Jean-Jacques




