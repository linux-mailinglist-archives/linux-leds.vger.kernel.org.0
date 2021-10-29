Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C049144013C
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 19:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhJ2R0S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 13:26:18 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:49375 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229826AbhJ2R0R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 29 Oct 2021 13:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635528228; x=1667064228;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vVwH1uHxIi267P0ANxe5Nu/bbd1cUbgemrp2d9uAeK8=;
  b=UEJ7FYcjBZ1WJhbKIqOTETwuo5NHmEEBuGxumEXL9666CK9/u5JlHtJQ
   Vybr5bVSu186kdWIl/f6bVT1mpmMFS0P1cm1Hs3GoLE1nON0ole+Hq81b
   M6W78XbH8i024eKlBPlVJw0BWLwHC9QU8t/l7UKzGQQRl1paoOH41AQte
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 10:23:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 10:23:48 -0700
Received: from [10.110.53.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 29 Oct 2021
 10:23:47 -0700
Subject: Re: [PATCH V3 2/4] leds: Add pm8350c support to Qualcomm LPG driver
To:     Satya Priya <quic_c_skakit@quicinc.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Rob Herring" <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <5e63cdf4-96c0-7849-7ebd-22fd60877e2e@quicinc.com>
Date:   Fri, 29 Oct 2021 10:23:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/29/2021 4:44 AM, Satya Priya wrote:
> From: satya priya <skakit@codeaurora.org>
> 
> Add pm8350c compatible and lpg_data to the driver.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Similar comment like earlier patch.

---Trilok Soni

