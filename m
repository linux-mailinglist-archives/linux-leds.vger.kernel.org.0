Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F93B25E49
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 08:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfEVGry (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 02:47:54 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34216 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVGrx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 02:47:53 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4M6hXdb020629;
        Wed, 22 May 2019 06:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=0TJtYNpaw4550+QkEZLSfCXNpCUpqhYJNA3RgqnlBio=;
 b=lr9nYeOYWDUN42HBXSbghdd5k1YkAx2ieWDi8h7/EX1p3riK+8jseLubgzbCV57mnDSX
 ndr1Qp1fAdnYFMWEYyb1guOz75/9BwAh/JsYRnuBHyNoFCb2bsQmxhHB3CVjAjUyb+z4
 MiLfqst6uKRcI7gk5N72Rc1agqnpvrbizN7UXL07i7H0q0uNV2IaiQLkW+IpbWdUykLY
 zXyEz3jJK6yctJYqoz0aEigdhq1Hyfs8dDTpd894Dwf3MTnykAGnkhJnqWv9m4SwG5dp
 DOU+dZJgEo1/iDtLuAGkttdVC+h7CfLnGGWGo+SQVbYYoYbS7LIgGF0FH+qkCn5SGSkY oQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2smsk59j1e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 06:47:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4M6k4qR003967;
        Wed, 22 May 2019 06:47:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2smsh1e35n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 06:47:44 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4M6lhjd026607;
        Wed, 22 May 2019 06:47:43 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 May 2019 06:47:42 +0000
Date:   Wed, 22 May 2019 09:47:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@01.org, Dan Murphy <dmurphy@ti.com>
Cc:     kbuild-all@01.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [j.anaszewski-leds:for-next 3/14]
 drivers/leds/leds-ti-lmu-common.c:97 ti_lmu_common_set_ramp() warn:
 impossible condition '(ramp_up < 0) => (0-255 < 0)'
Message-ID: <20190522064735.GK19380@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905220050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905220050
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
head:   413874ce52afa3310433e6dd73d775fd05bf92e7
commit: 9a8e66ebeaa20a4f3eba12f0eba6835e8db16ded [3/14] leds: TI LMU: Add common code for TI LMU devices

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/leds-ti-lmu-common.c:97 ti_lmu_common_set_ramp() warn: impossible condition '(ramp_up < 0) => (0-255 < 0)'
drivers/leds/leds-ti-lmu-common.c:97 ti_lmu_common_set_ramp() warn: impossible condition '(ramp_down < 0) => (0-255 < 0)'

# https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?id=9a8e66ebeaa20a4f3eba12f0eba6835e8db16ded
git remote add j.anaszewski-leds https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
git remote update j.anaszewski-leds
git checkout 9a8e66ebeaa20a4f3eba12f0eba6835e8db16ded
vim +97 drivers/leds/leds-ti-lmu-common.c

9a8e66eb Dan Murphy 2019-05-06   83  
9a8e66eb Dan Murphy 2019-05-06   84  int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
9a8e66eb Dan Murphy 2019-05-06   85  {
9a8e66eb Dan Murphy 2019-05-06   86  	struct regmap *regmap = lmu_bank->regmap;
9a8e66eb Dan Murphy 2019-05-06   87  	u8 ramp, ramp_up, ramp_down;
9a8e66eb Dan Murphy 2019-05-06   88  
9a8e66eb Dan Murphy 2019-05-06   89  	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
9a8e66eb Dan Murphy 2019-05-06   90  		ramp_up = 0;
9a8e66eb Dan Murphy 2019-05-06   91  		ramp_down = 0;
9a8e66eb Dan Murphy 2019-05-06   92  	} else {
9a8e66eb Dan Murphy 2019-05-06   93  		ramp_up = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_up_usec);
9a8e66eb Dan Murphy 2019-05-06   94  		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
9a8e66eb Dan Murphy 2019-05-06   95  	}
9a8e66eb Dan Murphy 2019-05-06   96  
9a8e66eb Dan Murphy 2019-05-06  @97  	if (ramp_up < 0 || ramp_down < 0)
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Utterly unpossible!

9a8e66eb Dan Murphy 2019-05-06   98  		return -EINVAL;
9a8e66eb Dan Murphy 2019-05-06   99  
9a8e66eb Dan Murphy 2019-05-06  100  	ramp = (ramp_up << 4) | ramp_down;
9a8e66eb Dan Murphy 2019-05-06  101  
9a8e66eb Dan Murphy 2019-05-06  102  	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
9a8e66eb Dan Murphy 2019-05-06  103  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
