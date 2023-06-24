Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9FB073CA4D
	for <lists+linux-leds@lfdr.de>; Sat, 24 Jun 2023 11:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbjFXJyO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Jun 2023 05:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjFXJyN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Jun 2023 05:54:13 -0400
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA53B0;
        Sat, 24 Jun 2023 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boaniger.com;
        s=selector3; t=1687600449; i=@boaniger.com;
        bh=Wuj+h4mwV9Tm7duhBINktIbLhIzOXSNpyo9CJUmQGJM=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Reply-To:Message-ID;
        b=AolmaF45iYTnAzMAu22cDxB6PzLt3FWGr+zfvWZZayYY8g4wPv6aH2yO5nXdssTAO
         jB0e+XsqHrI7hG/3tn+q5dKZuNJah4EMbwg7aegokGQcnmGOUlWadySwG4k8IGyCO6
         q67h81drbRzrYjYefJ5xOBIMqhtapROEmULA0PiA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRWlGSWpSXmKPExsUyy+mus6793mk
  pBi9fC1u0dR5isfjxYw6bxeOP95gttr5Zx2ixaFkrswOrx77v3xk9ds66y+7x89g8Vo/Pm+QC
  WKJYM/OS8isSWDN+tLczFSRXfP31k6WBMaCLkYtDSOAbo8SX5sNMcE7vxAmsEM5BRom3b/4xd
  zFycjAL6EncmDqFDcTmFRCUODnzCQtEXFti2cLXQDUcQLaaxNeuEpCwsAC3xJdX6xlBbBEBZY
  kX1/YwgdhsQPbnxy/BRrIIqEpc3LoXzBYSkJNY9mA+M8R4f4lf3T/YIeLyEt9uPmSewMg3C8k
  Vs5BcMQvJFbMQrljAyLKK0aw4tagstUjXSC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+x
  vFgvtbhYr7gyNzknRS8vtWQTIzDEU4pTA3YwHu36p3eIUZKDSUmUN8VkSooQX1J+SmVGYnFGf
  FFpTmrxIUY9Dg6BC2cffmIUuPLhUxOTFEtefl6qkgSv065pKUKCRanpqRVpmTnAmIRpkODgUR
  Lh/b8bKM1bXJCYW5yZDpE6xRjLsXnh3r3MHMcWgcjVO/cDye1g8n3TRSD56eMVIPngwDWQ+AU
  Q+XVb1wFmIZb0osRKKXHewD1AQwVAhmaU5sGthKWfS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5
  GJWEeSeBTOHJzCuBu+wV0NFMQEena00GObokESEl1cDkJ/pKWm1Zxyr+p1eYPp9b8uA8l/iaN
  QyTFGYmF8fkGT/epKE1MaDhdoTU047Yr0/tfh7LZbmrLxHXrT11reyck6U7UifwR3ZrRDwV0o
  1MXOXw8+p6t6/rO2aZL1TnzFswLfUlb5+jKd/bYx/abbZO5c5i6+sJ6l56OU7NSu1JbmP8dja
  7tArjGSW7RXPiQtIurHz6yex17ruZC20nfl2SXdVh5jjZ0fjV1rojbomFLMvjZ4odFuLyu1d9
  5u7hO1JCz4Nvdp9Nf/a+876OwYTTxrF9VVEuP+Qz5lzjC0yyjl/x7uev2ud6N8St5uaKc2SF/
  jB5MvmMTmhg55O2Hxw9HNEG65n/nRdaMzkqp06JpTgj0VCLuag4EQBE2XTMugMAAA==
X-Env-Sender: olena@boaniger.com
X-Msg-Ref: server-8.tower-725.messagelabs.com!1687600438!65740!11
X-Originating-IP: [154.66.221.67]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6733 invoked from network); 24 Jun 2023 09:54:07 -0000
Received: from unknown (HELO mail.boaniger.com) (154.66.221.67)
  by server-8.tower-725.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2023 09:54:07 -0000
Received: from WINSRVNE-ARCH.boaniger.local (10.107.72.27) by
 WINSRVNE-EXCH.boaniger.local (10.107.72.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 24 Jun 2023 10:54:37 +0100
Received: from WINSRVNE-EXCH.boaniger.local (10.107.72.8) by
 WINSRVNE-ARCH.boaniger.local (10.107.72.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 24 Jun 2023 10:54:36 +0100
Received: from [85.217.144.32] (85.217.144.32) by WINSRVNE-EXCH.boaniger.local
 (10.107.72.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 24 Jun 2023 10:54:35 +0100
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: hi
To:     Recipients <olena@boaniger.com>
From:   Ms Olena <olena@boaniger.com>
Date:   Sat, 24 Jun 2023 11:53:13 +0200
Reply-To: <os904425@gmail.com>
Message-ID: <76c6ea03-0c8f-416b-80c1-34d488dc6627@WINSRVNE-EXCH.boaniger.local>
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: boaniger.com]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [85.158.142.113 listed in list.dnswl.org]
        *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?85.217.144.32>]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [85.217.144.32 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [85.158.142.113 listed in wl.mailspike.net]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [os904425[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
I have funds for investment. Can we partner if you have a good business ide=
a?
Thanks, Olena.
