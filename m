Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60BA053BF3D
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jun 2022 22:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbiFBUCp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Jun 2022 16:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239084AbiFBUC3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Jun 2022 16:02:29 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Jun 2022 13:02:27 PDT
Received: from smtp687out9.mel.oss-core.net (smtp687out9.mel.oss-core.net [210.50.216.236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79DE2E10
        for <linux-leds@vger.kernel.org>; Thu,  2 Jun 2022 13:02:26 -0700 (PDT)
X-IPAS-Result: =?us-ascii?q?A2C4SQDRFZli/7NplnpaGgEBAQEBDR4LBgEBAQECAgEBA?=
 =?us-ascii?q?QECAQEBAQMBAQEBAQsJCYFGAqV9hxkbgiWJYwsBAQEhMAQBAYR4AQFZBYRzJ?=
 =?us-ascii?q?jcGDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgSBHIUvRoZUIAcBgVYBD?=
 =?us-ascii?q?gEehXUBAaxugTMNdIRZFIIQBAqCc4E9AYlGhV99gRCBSBCCOAGFfYNAgi4Ek?=
 =?us-ascii?q?kaEIwQbOwMhFRg0EoEhRSwBCAYGBwoFMgYCDBgUBAITElMdAhIMChwOVBkMD?=
 =?us-ascii?q?wMSAxEBBwILEggVLAgDAgMIAwIDLgIDGAkHCgMdCAoKEhIQFAIEBg0eCwgDG?=
 =?us-ascii?q?R8tCQIEDgNDCAsKAxEEAxMYCxYIEAQGAwkvDSgLAxQPAQYDBgIFBQEDIAMUA?=
 =?us-ascii?q?wUnBwMhBwsmDQ0EIx0DAwUmAwICGwcCAgMCBhcGAgJxCigNCAQIBAwQHSUTB?=
 =?us-ascii?q?QIHMQUELwIeBAUGEQkCFgIGBAUCBAQWAgISCAIIJxsHFjYZAQUOTwYLCSEcC?=
 =?us-ascii?q?SARBQYWAyNzBUgPKTU5BnwPrlKQQJ4zCoNOBSkHgQkHnkkxg2MBlxIRASeBV?=
 =?us-ascii?q?4tUlmioEoEYgX9wFYIIgRxQKJ0QgRACBgsBAQMJjwoBAQ?=
IronPort-Data: A9a23:yLUBZ6ALmAviChVW/6Hhw5YqxClBgxIJ4kV8jS/XYbTApDp2hDwPz
 2NNWDvXMqncamT1eNkgPYvnoEwGvp/UndY3OVdlrnsFo1Bi95OZWYzxwmQcns+2BpeeJK6yx
 5xGMrEsFC2wJ5Pljk/F3oLJ9BGQ7onVAOulYAL4EnopH1U8Fn970UgLd9MR2+aEv/DoW2thh
 vuqyyHvEAfNN+lcaz98Bwqr8XuDjdyq0N8qlgVWicNj4Dcyo0Io4Kc3fsldGZdXrr58RYZWT
 86bpF2wE/iwEx0FUrtJmZ6jGqEGryK70QWm0hJrt6aebhdqlBMV7qcfHcgnTBl+yD+ivvVU7
 Y4cjMnlIespFvWkdOU1bDh+VgMhEoNq0pbgfCGd2SCR5xScKT21nq0oVRlre9RHq46bAkkXn
 RAcADELYBerguuwzKP9Qe5p7igmBJmxZN5B5So9pd3fJfY8YdPIfeLu3OBjwD0StPJvEKmHP
 tVMPFKDazyFOXWjIGw/DJM4gfftgnTzaBVGp1+P46k6+W7eyEp2yreFDTbOUoXQH4AMwx7d/
 zqbuj2mU1cBKNXZ1jCf9XugjObJkWX9VZ5UHaDQGuNWvWB/D1c7UHU+PWZXa9Hg4qJic7qz8
 3Apxxc=
IronPort-HdrOrdr: A9a23:op7076FevuzLkmmIpLqEi8eALOsnbusQ8zAXPidKJiC9E/b1qy
 nAppUmPHPP4wr5JktBpTnoAsDpfZq7z/BICOIqV4tKMjOKhFeV
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.91,272,1647262800"; 
   d="scan'208";a="82056735"
Received: from 122-150-105-179.sta.wbroadband.net.au (HELO WIN-J7GFDBAO51J) ([122.150.105.179])
  by smtp687.mel.oss-core.net with ESMTP; 03 Jun 2022 06:01:19 +1000
From:   "Martin Otamori" <info@mandy.com>
Subject: Acknowledge this message
To:     <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: <okkmart68@gmail.com>
Date:   Thu, 2 Jun 2022 13:01:15 -0700
Message-Id: <20220206130114FB03D0BB0A-9D5164E0A9@mandy.com>
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?122.150.105.179>]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [210.50.216.236 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [122.150.105.179 listed in zen.spamhaus.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [okkmart68[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I will give you more details as soon as you acknowledge this message.
Thank you.
Martin Otamori.

